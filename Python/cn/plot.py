from cn.arithmetic import progression_fn
import matplotlib.pyplot as plt


def x_coordinates(range_, step_count):
    """
    Return a step_count number of  equidistant x-coordinates
    in the specified range_.

    step_count must be greater than or equal to 2.

    >>> x_coordinates([-1, 1], 2)
    (-1.0, 1.0)

    >>> x_coordinates([-1, 1], 3)
    (-1.0, 0.0, 1.0)

    >>> x_coordinates([-1, 1], 5)
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
    progression = progression_fn(step, x_min + step)

    # The values of the x-coordinates excluding the first
    # one (which is x_min) and the last one (which is x_max).
    # This is the reason because of we're sopping at step_count - 2.
    inner_xs = tuple(progression(x)
                     for x in range(step_count - 2))

    return (x_min, *inner_xs, x_max)


def evaluate_function(fn, xs):
    """
    Takes a function and a sequence of point where the
    function will be evaluated and return a list of
    (x, y) pairs.

    >>> evaluate_function(lambda x: abs(x), [-1, 0, 1])
    ((-1, 1), (0, 0), (1, 1))

    >>> evaluate_function(lambda x: x ** 2, x_coordinates([-1, 1], 3))
    ((-1.0, 1.0), (0.0, 0.0), (1.0, 1.0))
    """
    return tuple((x, fn(x)) for x in xs)


def make_figure(points):
    """
    Get the points generated by evaluate_function() and return
    a matplotlib figure object.
    You can display the plot by calling .show() on it.

    >>> make_figure(evaluate_function(cn.functions.fn_1,
                                      x_coordinates([-1, 1], 10))).show()
    """
    # ((1, 2), (3, 4), (5, 6))  ->  ((1, 3, 5), (2, 4, 6))
    xs, ys = tuple(zip(*points))

    x_range = (min(xs), max(xs))
    y_range = (min(ys), max(ys))

    figure, axes = plt.subplots()
    axes.plot(xs, ys)
    axes.axis([*x_range, *y_range])
    return figure