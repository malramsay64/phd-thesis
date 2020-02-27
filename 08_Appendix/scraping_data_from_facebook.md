+++
title = "Scraping Data from Facebook"
date = "2018-05-09"
authors = ["Malcolm Ramsay"]
tags = []

draft = false
math = false
highlight = true
+++

Competition is a strange thing
making you suddenly interested in the most unusual of problems
It has become a tradition of The Lancer Band,
of which I am a member,
to produce a video as part of our ANZAC Day commemorations.
These videos have been highly successful
garnering millions of views on Facebook and
with some choice communications throughout the rest of the year
have resulted in a commendable social media following.

After a successful drive to raise the number of page likes this year,
we became more interested in how we compared to other similar pages,
from other service bands in Australia,
to other units of the Australian Army.
Rather than manually collating all this data manually,
I looked for an automated solution for this process,
both to have up to date data,
and to store historical data
allowing for comparisons with these pages over time.

The method the internet recommends for getting data from Facebook
is through their [GraphAPI][graph-api],
a method of using http requests query specific data.
The first step in using the GraphAPI is getting an access token,
the simplest method though logging into the [GraphAPI Explorer][graph-api explorer],
a web based tool for testing GraphAPI.
In the process of getting an access token from the GraphAPI Explorer,
a prompt will ask for the permissions granted to the access token.
You can uncheck all the permissions since they are not required for this example.
The more permissions granted to an access token,
the more data from the GraphAPI is accessible,
here interested in the `fan_count`, which is the number of users who like the page.
Documentation for this value,
and all the other values can are available in the [page documentation][graph-api page ref].

With the page and data field to query and the access token,
it is possible to query the GraphAPI in python
using the requests package as in the code example below.

```python
import requests
page = 'thelancerband'
token = '<access_token>'
ret = requests.get(f'https://graph.facebook.com/{page}', params={'fields': 'fan_count', 'access_token': token})
ret.json()['fan_count']
```

Note that you will need to replace `<access_token>` with the token
generated from the [GraphAPI Explorer][graph-api explorer].
At the time of writing [The Lancer Band][thelancerband] has 6546 likes,
which is the value output when I ran the code snippet above.
Hopefully when you are try this the result is somewhat larger.

While the GraphAPI has a relatively simple interface for querying
many different types of data,
it has a fairly significant drawback for accessing data over periods of time.
The access tokens for the GraphAPI Explorer have an expiry of 1 hour,
meaning nearly every time you want to perform data collection you need a new token.
Programmatically generating access tokens requires the creation of a Facebook application.
While this sounds simple enough,
it requires getting the app reviewed and accepted by Facebook,
far more work than I was willing to put into this.
While these requirements are fair enough for all the personal information
having access to a Facebook profile provides,
I only want to access the publicly available likes data of a page.

With all the effort required
to go through the 'proper' methods to obtain this data,
I looked for alternate approaches.
As far as I can discern coming from the scientific realm,
two of the key packages for collecting and processing data from websites

- **[requests][]** for an interface with http requests and responses
- **[beautifulsoup4][]** which provides an interface
    for extracting information from a returned html/xml document.

We are going to use requests to get the page which has the number of likes contained on it,
then use beautifulsoup4 to extract the number required.

Finding the web address to use in the request is a case of navigating Facebook manually,
with the number of likes appearing on the community page
having the url [https://facebook.com/pg/thelancerband/community][].
The contents of this page can be downloaded using the code snippet below;

```python
import requests
page_name = "thelancerband"
community_page = requests.get(f"https://facebook.com/pg/{page_name}/community")
```

This gets the html,
from which we need to extract the number of likes.
Printing the entire returned page to output

```python
community_page.text
```

gives a huge wall of text.
Using the search functionality to look for instances of 'Total Likes'
finds the following code snippet


```html
...<div class="_3xom">6,546</div><div class="_3xok">Total Likes</div>...
```

The number of likes is in the div element preceding the div containing the text `Total Likes`.
Beautifulsoup4 allows us to programmatically traverse the document in a similar logic

```python
from bs4 import BeautifulSoup
document = BeautifulSoup(community_page, 'html.parser')
document.find(text='Total Likes').parent.previous
```

Here we search for text matching 'Total Likes',
which returns a reference to that location in the document.
The number of likes is the content of the previous div element,
by taking the parent element to select the surrounding div,
then the previous element we extract the value of the previous div element.

With the total number of likes as string,
we need to reformat it to convert to an integer.
This involves removing the comma as the thousands separator and
the SI prefixes `k`, `M`, etc. when the likes are in the hundreds of thousands or more.
The quick and dirty method of removing the comma is using `str.replace(',', '')`,
though a real project should use the `locale` module as described on [stackoverflow][locale commas].
A simple fix for the prefixes is installing the [humanfriendly][] package,
and using the `humanfriendly.parse_size()` function which will handle the prefixes.
This results in the code for getting likes from a list of pages looking like that below.

```python
from bs4 import BeautifulSoup
import humanfriendly
import requests

page_list = [
    "thelancerband",
]

def get_num_likes(page_id):
    community_page = requests.get(f"https://facebook.com/pg/{page_id}/community")
    document = BeautifulSoup(community_page, 'html.parser')
    page_likes = humanfriendly.parse_size(
        document.find(text='Total Likes').parent.previous.replace(',', '')
    )
    return page_likes

for page in page_list:
    print(f'The Facebook page for {page} has {get_num_likes(page)} likes')
```

This prints the results to the screen,
which is not useful for longer term analysis
although it is easy to see that everything is working as expected.

There are many different methods for storing this data for later analysis,
from a simple csv file to a sqlite database.
I am most familiar with pandas and HDF5 files,
hence these were my tools of choice
resulting in the data collection loop below.

```python
import pandas
data = []
for page in page_list:
    data.append({
        'page_id': page,
        'likes': get_num_likes(page),
        'time': pandas.Timestamp.now(),
    })
df = pandas.DataFraame.from_records(data)
df.set_index('time').to_hdf('likes_data.h5', 'data', format='table', append=True)
```

Note that the `tables` package is also a requirement for this code snippet to work.

This is my first foray into scraping websites for data analysis
which is surprisingly simple with the appropriate tools.
The biggest issue I encountered in this project
was trying to understand the Facebook authentication tokens.
While this is a simple example,
it can easily be extended for different use cases.


[graph-api]: https://developers.facebook.com/docs/graph-api
[graph-api explorer]: https://developers.facebook.com/tools/explorer/
[graph-api page ref]: https://developers.facebook.com/docs/graph-api/reference/page
[thelancerband]: https://facebook.com/thelancerband
[thelancerband community]: https://facebook.com/pg/thelancerband/community
[beautifulsoup4]: https://www.crummy.com/software/BeautifulSoup/bs4/doc/
[requests]: http://docs.python-requests.org/en/master/
[locale commas]: https://stackoverflow.com/questions/1779288/how-do-i-use-python-to-convert-a-string-to-a-number-if-it-has-commas-in-it-as-th
[humanfriendly]: https://pypi.org/project/humanfriendly/
[lancerband likes]: https://github.com/malramsay64/lancerband-likes
