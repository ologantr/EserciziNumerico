import operator
from functools import reduce


def progression(step, start=0):
    """
    Return a function that returns the nth element of
    an arithmethic progression with a given step and
    starting from a given value.

    >>> [progression(3)(x) for x in range(5)]
    [0, 3, 6, 9, 12]

    >>> [progression(2, 1)(x) for x in range(5)]
    [1, 3, 5, 7, 9]

    >>> [progression(0.5, -1)(x) for x in range(5)]
    [-1.0, -0.5, 0.0, 0.5, 1.0]
    """
    return lambda n: start + (n * step)


def product(xs):
    """
    Like the sum() builtin, but multiply instead of adding.

    >>> product(x for x in range(1, 4))
    6

    >>> product((-1, 2, 5))
    -10
    """
    return reduce(operator.mul, xs, 1)
