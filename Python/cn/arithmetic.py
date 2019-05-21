def progression(step, n, start=0):
    """
    Return an arithmetic progression of n elements with
    a given step and starting from a given value.

    The returned value is a lazy sequence in the form of
    a range. You will need to realize it by yourself i.e.
    casting it to a list or a tuple or calling next().

    If step is a float this function will not work, because
    the range() builtin only handles an integer step. You will
    need to use progression_fn() instead.

    >>> list(progression(3, 5))
    [0, 3, 6, 9, 12]

    >>> list(progression(2, 5, 1))
    [1, 3, 5, 7, 9]
    """
    return range(start, start + (step * n), step)


def progression_fn(step, start=0):
    """
    Return a function that returns the nth element of
    an arithmethic progression with a given step and
    starting from a given value.

    >>> [progression_fn(3)(x) for x in range(5)]
    [0, 3, 6, 9, 12]

    >>> [progression_fn(2, 1)(x) for x in range(5)]
    [1, 3, 5, 7, 9]

    >>> [progression_fn(0.5, -1)(x) for x in range(5)]
    [-1.0, -0.5, 0.0, 0.5, 1.0]
    """
    return lambda n: start + (n * step)
