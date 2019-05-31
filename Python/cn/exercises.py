from math import cos, pi
from cn.algebra import evaluate, linspace
from cn.interpolation import linear_interpolation
from cn.plot import make_compound_figure, make_plot_descriptor
import cn.functions


def alt_linspace(range_, step_count):
    min_, max_ = range_

    def x(i):
        return cos(((2 * (step_count - i) + 1) * pi)
                   / (2 * (step_count + 1)))

    def t(i):
        return ((max_ - min_)
                / (2 * x(i)
                   + ((max_ + min_) / 2)))

    if min_ == -1 and max_ == 1:
        return tuple(x(i) for i in range(step_count))
    else:
        return tuple(t(i) for i in range(step_count))


def e7_01():
    function = cn.functions.fn_1
    space_fn = linspace  # linspace or alt_linspace
    range_ = [-1, 1]
    actual_points_number = 5
    interpolation_points_number = 100

    actual_xs = space_fn(range_, actual_points_number)
    interpolation_xs = space_fn(range_, interpolation_points_number)

    actual_points = evaluate(function, actual_xs)
    expected_points = evaluate(function, interpolation_xs)

    interpolation_fn = linear_interpolation(actual_points)
    interpolated_points = evaluate(interpolation_fn, interpolation_xs)

    # Return a tuple of pair where the first item is the x value
    # and the second item is the difference between what we got
    # from the interpolation process and what the function
    # actually returns.
    error_points = tuple((expected_point[0],
                          abs(expected_point[1] - interpolated_point[1]))
                         for expected_point, interpolated_point
                         in zip(expected_points, interpolated_points))

    make_compound_figure(
        make_plot_descriptor('Funzione originale', actual_points),
        make_plot_descriptor('Funzione interpolata', interpolated_points),
        make_plot_descriptor('Funzione prevista', expected_points),
        make_plot_descriptor('Errore', error_points)
    ).show()
