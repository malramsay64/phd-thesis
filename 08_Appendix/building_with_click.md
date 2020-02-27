# Building interfaces with click (2017-08-03)

Running computer simulations is great.
You tell the computer what to do,
it sits there crunching numbers for a while.
Then you can come back and look at the results.
The problem with this is that most simulation packages
take the simulation parameters in an input file,
so running a simulation becomes;

1. Write an input file
2. Run simulation
3. Edit input file
4. Run simulation
5. Forget what the old file looked like

Click can help us break this pattern,
providing us with a simple way to pass values to scripts from the command line.
Allowing us to build command line applications that
take care of editing these input files for us.

## What is Click?

Click is a python library that provides function decorators for
passing arguments to function calls through arguments and options on the command line.
Click handles all the parsing for us, including the parsing of types,
and also allows for some simple validation of values.

Understanding click is probably best done through an example.
Let's say we have a script to run a simulation that looks like below

```python
#!/usr/bin/env python
# run_simulation.py

import time

def main():
    time.sleep(30)
    print('Simulation Finished!')

if __name__ == '__main__':
    main()
```

To change the length of time we seep for we could edit the script manually,
but we want to sleep for a whole range of different times.
To pass an sleep value from the command line we can modify the script as follows;

```python
#!/usr/bin/env python
# run_simulation.py

import time
import click

@click.command()
@click.argument('sleep_time', type=int)
def main(sleep_time):
    time.sleep(sleep_time)
    print('Simulation Finished!')

if __name__ == '__main__':
    main()
```

The script can then be run as follows

```sh
$ python run_simulation.py 1
Simulation Finished!
```

which will sleep for 1 second then print the output.

## Taking it up a level

Changing the time we sleep for is nice,
but we are lazy and don't want to have to specify this every time.
We also want to be able to specify the output string
and the file the output is written to.
Easy!!!

To make the `sleep_time` optional we can use the following like of code

```python
@click.option('-t', '--sleep-time', type=int, default=5)
```

now rather than passing the time as an ordered argument,
we pass it as an option as either the short `-t <time>`
or long `--sleep-time <time>` way.
Note that the variable name is extracted from the long form
with the hyphen being converted to an underscore.

There is another improvement we can make to this `sleep_time` option.
It is impossible to sleep for a negative time,
and we don't want to wait for longer than a minute for this to run.
Click allows us to set a range of suitable values

```python
@click.option('-t', '--sleep-time', type=click.IntRange(min=0, max=60), default=5)
```

Now when we run the simulation

```sh
$ python run_simulation.py
Simulation Finished!
$ python run_simulation.py -t 5
Simulation Finished!
$ python run_simulation.py -t -1
Usage: run_simulation.py [OPTIONS]

Error: Invalid value for "-t" / "--sleep-time": -1 is not in the valid range of 0 to 60.
$ python run_simulation.py -t 61
Usage: run_simulation.py [OPTIONS]

Error: Invalid value for "-t" / "--sleep-time": 61 is not in the valid range of 0 to 60.
```

Awesome, we can stop ourselves accidentally running a simulation that takes forever
and we get a helpful error message when we do.
In fact click will generate help documentation for us

```shell
$ python run_simulation.py --help
Usage: run_simulation.py [OPTIONS]

Options:
  -t, --sleep-time INTEGER RANGE
  --help                          Show this message and exit.
```

We can help it generate this help by providing a help string to our arguments and options

```python
@click.option('-t', '--sleep-time', type=click.IntRange(min=0, max=60), default=5,
              help='Specify the time for which the simulation will run.')
```

So we have the sleep time sorted,
now for the output string and file.
The output string is just like the sleep time,
we can add another option;

```python
@click.option('--outstring', type=str, default='Simulation Finished!',
              help='String to print to output file at the end of the simulation.')
```

Just make sure that when you pass a value to this option
that spaces are either escaped or quoted,
otherwise they will be parsed as separate arguments.

Click also has excellent support for file input and output,
including reading from stdin and writing to stdout.
We get this functionality by using  `click.File` as the type like below

```python
@click.argument('output', default='-', type=click.File('w'))
```

What does this all mean.
There is an argument, `output` which has the type of a writable file.
It will return a file object that we can write to directly,
click handles the open/close for us.
The default value `'-'` is stdout,
like in other command line tools where you can use `-` to indicate
read from or write to stdin/stdout,
click has the same support.

## Bringing it all together

With all these modifications we end up with a script that looks like this;


```python
#!/usr/bin/env python
# run_simulation.py

import time
import click

@click.command()
@click.argument('output', default='-', type=click.File('w'))
@click.option('-t', '--sleep-time', type=click.IntRange(min=0, max=60), default=5,
              help='Specify the time for which the simulation will run.')
@click.option('--outstring', type=str, default='Simulation Finished!',
              help='String to print to OUTPUT at the end of the simulation.')
def main(output, sleep_time, outstring):
    time.sleep(sleep_time)
    output.write(outstring + '\n')

if __name__ == '__main__':
    main()
```

To work out how to run the script we can use the help

```shell
$ python run_simulation.py --help
Usage: run_simulation.py [OPTIONS] [OUTPUT]

Options:
  -t, --sleep-time INTEGER RANGE  Specify the time for which the simulation
                                  will run.
  --outstring TEXT                String to print to output file at the end of
                                  the simulation.
  --help                          Show this message and exit.
```

or just run the command

```shell
python run_simulation.py -t 1 --outstring "Hello World." hello.txt
```

We have taken a simple script that can perform a single task
and with an extra 7 lines of code have turned it into a versatile tool.
There is plenty more functionality available with Click,
and you should check out the [documentation](http://click.pocoo.org/5/).

<!-- markdownlint-disable-file -->
