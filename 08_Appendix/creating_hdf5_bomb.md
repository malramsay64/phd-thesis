# Creating an HDF5 Bomb (2018-03-15)

You may have heard of a [zip bomb][zip bomb] or other decompression 'bombs',
which have the basic premise of containing a large volume of highly redundant data
that when decompressed takes up more resources than the system can handle.
Within the HDF5 file format there is [support for compression][hdf5 compression],
an excellent tool for reducing file sizes,
however also ripe for exploitation.
This 'issue'[^1] of a file containing far more data expected, whether accidental or malicious,
is not limited to HDF5 files, any filetype supporting compression is susceptible.

How do you actually create one a decompression bomb.
The simplest method in python is to create a pandas DataFrame
comprising lots of strings which are all the same.
```python
import pandas as pd
large_number = 1_000_000
df = pd.DataFrame({'evil': ['x']*large_number})
```
Using the `sys.getsizeof` function we can find
the size in memory of this DataFrame
```python
import sys.getsizeof
sys.getsizeof(df) / 1024 / 1024  # bytes / kilobytes / megabytes
```
which turns out to be 840 MB,
10 times larger than a DataFrame with the same number of integers.
This significant overhead of using strings is because
each element in the DataFrame contains all the storage overhead of a python object,[^2]
rather than each column for numerical types,
and is the main reason I chose strings for this diabolical construct.

Now we have a large, low entropy dataset we need to save it to disk.
```python
with pd.HDFStore('dataset.h5', mode='w', complevel=9, complib='bzip2') as dst:
    dst.append('data', df)
```
A number of keyword arguments are set in opening the HDFStore file handle,

- `mode='w'` ensures that a file with the same name is overwritten if it exists, making testing this
    out much simpler.
- `complevel=9` sets the compression to the maximum possible not caring about the processing
    requirements of doing so.
- `complib='bzip2'` sets the compression library to `bzip2` which had significantly better
    compression ratios than the default `zlib` in my testing of this.

Additionally the `append` function has been used to write the DataFrame to disk
since we want to create a dataframe that doesn't fit in memory,
which will require appending to the file numerous times.
With these options, the 840 MB DataFrame is a 2.2 MB HDF5 file on disk,
a compression ratio greater than 200.

With all the pieces in place we can now construct our file.
```python
num_iters = 20
with pd.HDFStore('dataset.h5', mode='w', complevel=9, complib='bzip2') as dst:
    for _ in range(num_iters):
        dst.append('data', df)
```
This generates a [small unsuspecting 42 MB file][hdf5 bomb][^3]
which when loaded as a pandas DataFrame becomes an 18 GB object in memory,
a compression ratio of 440.

While this is a little fun and devious,
it does highlight the importance of thinking about how we represent the data we are processing,
in particular text data.
I originally came across this HDF5 bomb by accident,
leaving a field as text when it should have been a category.
In this devious case presented, using the type 'category' in the DataFrame
```
df['evil'] = df['evil'].astype('category')
```
our 840 MB DataFrame becomes 10 MB,
and there are no issues storing 20 of them in memory.
While it may be cool to use big data tools like Spark, Dask, or Hadoop
sometimes the simplest approach is to make the big data small.


[^1]: The compression is working exactly as intended, it just hides the true size of the underlying data.
[^2]: From interrogating the size of the DataFrame using either `sys.getsizeof(df)` or `df.memory_useage(deep=True)` it appears that the memory is allocated for each object. When querying the individual objects using `id`, they all return the same value, which is the same as just the string. I don't know what is going on and would be happy for someone to point me to a good resource.
[^3]: Of course you are going to download a file some random stranger on the internet tells you is going to crash your python interpreter.


[zip bomb]: https://en.wikipedia.org/wiki/Zip_bomb
[hdf5 compression]: https://support.hdfgroup.org/HDF5/faq/compression.html
[hdf5 bomb]: https://drive.google.com/open?id=1tlr00OFEuKMkSz0slczInh3211-ZRBIz

<!-- markdownlint-disable-file -->
