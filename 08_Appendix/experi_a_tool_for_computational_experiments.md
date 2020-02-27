# Experi: A tool for computational experiments

2018-06-25

## Abstract

One of the key features of computational experiments is being able to run the experiment over
a large variable space. However, in my experience there aren't tools available to assist with this,
particularly in the realm of High Performance Computing (HPC), where bash arrays and loops are
commonplace. Using the current toolset, I made lots of errors in the specification of files,
turning a 'quick edit' into a tedious process of find the bug. To make complicated experiment
variable expression a simple and intuitive task I have developed [Experi][], which takes a list of
commands and variables from a [YAML][] input file and either runs them for testing or creates and
submits files to an HPC scheduler. I have designed Experi to be a simple replacement for current
workflows, using shell commands into which you add variables, and variables defined along with how
they are combined. I have been using Experi as I have been developing it and though it hasn't
prevented me from running software with bugs, I can specify the variables I want to use for
a simulation without having to worry about the execution. As an added benefit, I also have
a complete record of every simulation that I run which is version controllable.

Experi is installable using both `pip` and `conda`,

```shell
$ pip install experi
```

Currently, Experi only runs on python 3.6, because that is what I use and "premature optimisation is
the root of all evil." If you would like to use Experi and can't use python 3.6, please let me know
along with which python version you do use and I can look into supporting it.

---

I work in science where most compute intensive problems are handled by High Performance Computing
(HPC) clusters. From the user perspective the entire cluster appears as a single host, with
resources accessible through a job scheduler. You submit work as a script to the scheduler along
with the resources required, where it will wait in a queue for those resources to be available. Once
your script is running, it can access the resources allocated. When using a parallelism technology
like MPI, the MPI software will detect all the resources and connecting the appropriate pieces
together. This makes for a reasonably simple method of accessing the vast compute capabilities of
HPCs.

Bash scripts are normally used to specify the work to take place; with additional scheduler
directives denoting the resources required. One of scheduler directives you can specify is to make
the job as an array job, where multiple instances of your file are submitted at once with an array
index. In some ways this is similar to a numpy array operation rather than a `for` loop. The array
job is able to make best use of the scheduler, splitting a large task into many smaller tasks
which are easier to fit onto the cluster. This kind of workflow is ideal for running an experiment
at different conditions, or with many replications.

With the scheduler I use, [PBSPro][] an array job is specified using the `-J` flag and takes an
argument instructing how to create the values. The argument has the form
`<start_index>-<end_index>:<increment>`, e.g. `1-10:2` will generate five jobs for the scheduler
which will each have the bash variable `PBS_ARRAY_INDEX` containing one of `1,3,5,7,9`. While this
can be useful where you need to vary a parameter over a sequence of integers, the more likely use
case is creating a list of values which you are then indexing using `PBS_ARRAY_INDEX` like the
example below

```bash
ARRAY = (1.0 1.5 2.0 2.5 3.0 4.0)
value = "${ARRAY[$PBS_ARRAY_INDEX]}"
```

When specifying my jobs for the scheduler I was making lots of mistakes writing a job script that
was valid and reflected my intentions. This was difficult in that each job involved changing
multiple variables and I only had a single index. While Bash is excellent for specifying complex
commands for the computer to interpret, when dealing with long commands and lots of variables it
quickly becomes too complicated to easily read. When I am designing a computational experiment
I think about the commands I want to run separately from the variables I am going to use in those
commands.

My experiments have a recipe that look something like;

1. Create a state with the properties I desire. This could be a liquid, a crystal, or a combination
   of the two.
2. Bring the initial state to the conditions I want to collect data, ensuring the new state is
   representative of those conditions.
3. Collect lots of data on how my experiment behaves at this specific condition.

I have presented each of these steps abstractly as they are applicable to many different
experiments. It is also the level of abstraction for the command line interface, [sdrun][], I have
written to help run my experiments. A command I would run for the create step would be

```bash
$ sdrun --temperature 0.1 --num-steps 100 --space-group p2 create configuration.out
```

I specify the variables for the simulation, the type of simulation being `create`, and then the
output file.

For each of the three steps above I now want to define the specific variables I am using;

- Crystal Structure:
    - p2
    - p2gg
    - pg

- Temperature:
    - 0.4
    - 0.45
    - 0.50
    - 0.6
- Steps:
    - 1_000_000
    - 1_000_000
    - 500_000
    - 100_000

I want to run the same simulation for each of three different crystal
structures, p2, p2gg, and pg. This simulation will be over a range of
temperatures, with smaller spacing at lower temperatures where there is
interesting behaviour. Also the effects I am looking for happen faster at
higher temperatures so I am going to run shorter simulations for the higher
temperatures.

In presenting the values for the variables in a concise way, a table is possibly clearer though much
less concise, I am nearly using [YAML][] syntax. YAML is a method of encoding both structure and
data in a human readable format. You can think about it as a way of defining python lists and dicts
in a text file. Lists are a series of bullet points,

```yaml
- 0
- 1
- 2
- 3
- 4
```

with the snippet above being the list `[0, 1, 2, 3, 4]` in python. Dicts are
mappings of values using the colon `:` as a separator

```yaml
hello: world
foo: bar
```

being the dict `{"hello": "world", "foo": "bar"}` in python.


With the goal of being able to easily specify commands required for an experiment in addition to the
variables to fill into those commands, I have developed [Experi][]. It takes a YAML file as input,
declaring the experiment that will take place, and either creates and submits files to the scheduler
or runs the experiment in the current shell for testing. Taking the example I constructed above, to
completely specify the experiment for Experi;

```yaml
# experiment.yml
commands:
  - sdrun --space-group {crystal} -t 0.3 -s 1000 create configuration-{crystal}-0.3.out
  - >
    sdrun
    --space-group {crystal}
    --init-temp 0.3
    --temperature {temperature}
    --num-steps {steps}
    equil
    config-{crystal}-0.3.out
    config-{crystal}-{temperature:.2f}.out
  - sdrun --space-group {crystal} -t {temperature} -s {steps} prod config-{crystal}-{temperature:.2f}.out

variables:
  crystal:
    - p2
    - pg
    - p2gg

  zip:
    temperature:
      - 0.4
      - 0.45
      - 0.50
      - 0.6
    steps:
      - 1_000_000
      - 1_000_000
      - 500_000
      - 100_000

pbs:
  ncpus: 12
  walltime: 100:00:00
  j: oe
```

There are three commands which will be run; firstly a `create` step, secondly an `equil`
step, finally a `prod` step. The longer command of the `equil` step is broken
over multiple lines, and since I am using the YAML syntax for a multiline string `>`, it is
interpreted as a single long string hence no need for line continuation characters. Where I want to
replace the variables I have enclosed the variable name in braces (`{}`), which will be
automatically replaced using [python string formatting][]. Using this format allows for modifiers
like `{temperature:.2f}` which is replaced with the temperature as a float having two decimal
places, i.e. `0.4` -> `'0.40'`.

Commands in Experi are guaranteed to be run in a linear fashion, i.e. none of the `equil`
simulations will run until the `create` simulations are finished, with the additional constraint
that all previous steps are successful. This holds for both running in the local terminal, or using
the job scheduler.

Variables for the experiment are specified in their own section, with the variable name as the
dictionary key, followed by a list of values---a single value is also supported. Variables can take
on any valid string with the exception of `zip` or `product` which are used define how the variables
are combined. `zip` acts on the variables like a zipper, taking variables with the same number of
values and matching the values up 1:1. In this case we get

- temperature: 0.4 steps: 1_000_000
- temperature: 0.45 steps: 1_000_000
- temperature: 0.50 steps: 500_000
- temperature: 0.6 steps: 100_000

`product` is also somewhat self-descriptive, taking the 'product' of all the values to give all
possible combinations. `product` is the default operation and is not explicitly required so each of
the three crystals will have simulations with the temperature and steps listed above.

Where multiple `zip` operations are required, a list of dictionaries can be supplied to the `zip`
key with each being zipped separately before taking the product of each item in the list.

The final part of the YAML file is the specification of the options for the PBS scheduler. There are
some values which can be passed as keys;

- select/nodes
- ncpus/cpus
- ngpus/gpus
- memory/mem
- walltime
- cputime
- project
- setup

While any options not specifically encoded can be passed by using the flag as the key. In the
example above I have used `j: oe` which will become the scheduler option `-j oe` which is specifying
that the stdout (`o`) and stderr (`e`) will be joined in the stdout stream.

The `setup` key allows for commands to load the required variables, modules, or anything else that
is required before each command is run.

It should be noted that YAML is not without [idiosyncrasies][yaml not so great]. However, it is
powerful and widespread and I like and understand the format. The structure of Experi is not
specific to YAML and could easily work with JSON or TOML input files if someone wants to put effort
into the implementation and documentation.

With the input file specified, assuming it is named `experiment.yml`, the simulation can be
submitted to the scheduler using the command

```bash
$ experi
```

which will submit the job to the scheduler if it is available. Regardless of the presence of the
scheduler, a file is created for each command which includes all the combinations of variables
specified in a bash array which is suitable for manual submission.

Using Experi for the design and execution of computational experiments has significantly benefited
my science workflow. This is most noticeable with the replication and modification of experiments.
I have a complete record of all the commands and options required for the experiment to run and
I can focus on modifying values without having to worry about how to loop over the range of
variables I require.


[Experi]: https://github.com/malramsay64/experi
[experi issues]: https://github.com/malramsay64/experi/issues
[PBSPro]: http://www.pbspro.org/
[YAML]: https://en.wikipedia.org/wiki/YAML
[yaml not so great]: https://arp242.net/weblog/yaml_probably_not_so_great_after_all.html
[sdrun]: https://github.com/malramsay64/statdyn-simulation
[python string formatting]: https://pyformat.info/
