from cn.arithmetic import progression


def linspace(range_, step_count):
    """
    Return a step_count number of  equidistant x-coordinates
    in the specified range_.

    step_count must be greater than or equal to 2.

    >>> linspace([-1, 1], 2)
    (-1.0, 1.0)

    >>> linspace([-1, 1], 3)
    (-1.0, 0.0, 1.0)

    >>> linspace([-1, 1], 5)
    (-1.0, -0.5, 0.0, 0.5, 1.0)
    """
    # The first and the last value of the x-coordinates.
    x_min = float(range_[0])
    x_max = float(range_[1])

    # The common difference in the arithmetic progression
    # or the step between the nth value of the x-coordinate
    # and the following one.
    # If we want N point it means that we're dividing the
    # range in N - 1 slices.
    step = (x_max - x_min) / (step_count - 1)

    # The function that will compute the arithmetic
    # progression for the required step starting from
    # the second value of the x-coordinates.
    # We already know x_min and we're not computing it again.
    prog = progression(step, x_min + step)

    # The values of the x-coordinates excluding the first
    # one (which is x_min) and the last one (which is x_max).
    # This is the reason because of we're sopping at step_count - 2.
    inner_xs = tuple(prog(x)
                     for x in range(step_count - 2))

    return (x_min, *inner_xs, x_max)


def evaluate(fn, xs):
    """
    Takes a function and a sequence of point where the
    function will be evaluated and return a list of
    (x, y) pairs.

    >>> evaluate(lambda x: abs(x), [-1, 0, 1])
    ((-1, 1), (0, 0), (1, 1))

    >>> evaluate(lambda x: x ** 2, linspace([-1, 1], 3))
    ((-1.0, 1.0), (0.0, 0.0), (1.0, 1.0))
    """
    return tuple((x, fn(x)) for x in xs)
