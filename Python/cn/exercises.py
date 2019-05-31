from math import cos, pi
from cn.algebra import evaluate, linspace
from cn.interpolation import linear_interpolation
from cn.plot import make_compound_figure
import cn.functions


def e7_01():
    function = cn.functions.fn_1
    range_ = [-1, 1]
    actual_points_number = 5
    interpolation_points_number = 100

    actual_xs = linspace(range_, actual_points_number)
    interpolation_xs = linspace(range_, interpolation_points_number)

    actual_points = evaluate(function, actual_xs)

    poly = linear_interpolation(actual_points)
    interpolated_points = tuple((x, poly(x))
                                for x in interpolation_xs)

    make_compound_figure(actual_points, interpolated_points).show()
