# Speed Through Specificity (2018-08-07)

A common criticism about the Python programming language is that it is slow, often with reference to
a benchmark comparing a range of tasks. This criticism is widely addressed with articles by
[Jake van der Plass] and [Anthony Shaw] being two excellent examples. While I don't disagree with any of
the points raised in these articles, I think they miss an important aspect of
performance---specificity. Python is a general purpose language, used for nearly everything from
embedded devices with [uPython] to distributed processing of [petabytes of data][big data example].

Speed comes through specificity for a task. Even when working with C or C++, which are generally
regarded as the reference standard for performance, there is still an argument to be made for
increased performance through hand optimised assembly. Writing assembly, which is the stream of
instructions the CPU interprets to do its work, *can* result in faster code than a compiler if you
know what you doing. Only nearly no-one actually writes assembly because we want our applications to
work on different processor architectures and to take advantage of the features of newer CPUs like
out-of-order execution.[^1] Instead of writing the fastest possible code for a particular processor
a more common approach is to provide hints to the compiler to help it optimise performance, trading
some performance for generality and simplicity.

While it is uncommon to try and eke out every last bit of performance from a CPU, offloading the
work to more specialised hardware is commonplace. A CPU is a general purpose tool being adaptable to
many different types of operations which make it ideal for powering our computers, though to really
understand *fast* we need specialised hardware like GPUs, FPGAs, or ASICs. Graphics Processing Units
([GPUs])[^2] are designed for performing the same operation on large quantities of data at the same
time; whether that is working out the colour of each pixel on a display, or the values at each point
of a large matrix. GPUs are designed at a hardware level to perform these types of tasks, eschewing
much of the capability of a CPU. Having hardware specific to a task is a key factor for performance
and Field Programmable Gate Arrays ([FPGAs]) are one method of achieving this. Instead of providing
a stream of instructions to be interpreted like a CPU or GPU, an FPGA is programmed by arranging the
circuits to perform the desired processing, providing phenomenal processing capability. FPGAs are
used in places like [signal processing][fpga signal processing] and the [Mars Rovers][fpga mars rovers]
as they allow for reprogramming for task switching or hardware updates. In some applications
the programmability of a FPGA is unnecessary, so Application-Specific Integrated Circuits ([ASICs])
are used instead. An ASIC is a piece of silicon for processing a single specific task, with a common
use case being decoding video streams enabling you to watch hours of video in a single charge on
your phone. The progression of hardware from CPU to GPU to FPGA to ASIC represents an increasing
specificity to a task for improved performance at that task.

The specificity of a task doesn't just refer to the low level details of processor architecture,
there are also the levels most developers are more likely to encounter of type and application
specificity. Python is a dynamically typed programing language, allowing variables to change type
and change functionality during execution. A byproduct of this dynamic typing is types and operator
functions need to be evaluated for each operation. Should we want to add the values of two lists
together like in the example below, each time the code reaches the line `result = i + j` it has to
evaluate the types of both `i` and `j` to then work out how to perform the addition operation. Most
noticeable with large numbers of numerical values, the type evaluation takes far longer than the
addition operation.

```python
list1 = [1, 2, 3]
list2 = [4, 5, 6]
list_result = []
for i, j in zip(list1, list2):
    result = i + j
    list_result.append(result)
```

A key concept in optimising numerical python code is limiting the number of type evaluations, with
the canonical method being to use [NumPy] arrays. Instead of having a list which is able to hold
many different objects, NumPy arrays only contain a single type meaning the type only needs to be
evaluated once for the entire array. Other optimisation techniques for numerical python, namely
[Cython] and [Numba], operate in a very similar way; reducing the calculation to a limited range of
types evaluated once. With these tools for numerical computation it is possible to get performance
on par or even exceeding that of C code.

Even with the most specific type information the approach to solving a problem is a huge factor for
performance. Applications designed to solve a very specific problem are able to make significant
optimisations though handling only the cases the application will come across; an algorithm for
acyclic graphs doesn't have to handle cyclic graphs. Additionally an application for user
interaction can optimise for responsiveness, or a data processing application can optimise for data
throughput. The general purpose tool has to optimise for everything, so it is optimised for nothing.
Python is a general purpose programming language; not optimised for numerical computing, for the
web, for command line scripts, or any other use case. However, the adaptability of python has
allowed the development of application specific tools, like NumPy, containing a small range of very
specific functionality. Python also allows for the simple integration of problem specific hardware,
with tools like [PyCUDA], [scikit-cuda], [MyHDL], [nifpga-python], and many others.

Where speed is important, use the specific tool for the job. In most cases this isn't the python
standard library, instead it is usually just a `pip install` away.[^3]

[^1]: I guess you could also consider this a [bug...][meltdown]
[^2]: I would consider [Tensor Processing Units] (TPUs) in the same category as GPUs, with the main difference being the targeted precision of mathematical operations.
[^3]: Or `conda install` for the tools requiring C/C++ libraries

[Jake van der Plass]: https://jakevdp.github.io/blog/2014/05/09/why-python-is-slow/
[Anthony Shaw]: https://hackernoon.com/why-is-python-so-slow-e5074b6fe55b
[big data example]: https://www.youtube.com/watch?v=Hd_ydJeyr5M
[uPython]: https://micropython.org/
[GPUs]: https://en.wikipedia.org/wiki/Graphics_processing_unit
[Tensor Processing Units]: https://en.wikipedia.org/wiki/Tensor_processing_unit
[FPGAs]: https://en.wikipedia.org/wiki/Field-programmable_gate_array
[ASICs]: https://en.wikipedia.org/wiki/Application-specific_integrated_circuit
[meltdown]: https://meltdownattack.com/
[openblas assembly]: https://github.com/xianyi/OpenBLAS/blob/develop/kernel/x86_64/gemm_kernel_8x4_sse3.S
[fpga signal processing]: https://people.eecs.berkeley.edu/~bora/publications/Asilomar06b.pdf
[fpga mars rovers]: https://www.eetimes.com/document.asp?doc_id=1262350
[Numpy]: http://www.numpy.org/
[Cython]: http://cython.org/
[Numba]: https://numba.pydata.org/
[PyCUDA]: https://documen.tician.de/pycuda/
[scikit-cuda]: https://scikit-cuda.readthedocs.io/en/latest/
[MyHDL]: http://www.myhdl.org/
[nifpga-python]: http://nifpga-python.readthedocs.io/en/latest/

<!-- markdownlint-disable-file -->
