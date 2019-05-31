from cn.algebra import evaluate, linspace
from cn.interpolation import linear_interpolation
from cn.plot import make_compound_figure
import cn.functions


def e7_01():
    function = cn.functions.fn_1
    range_ = [-1, 1]
    real_points_number = 5
    interpolated_points_number = 100

    real_points = evaluate(function,
                           linspace(range_, real_points_number))

    poly = linear_interpolation(real_points)
    interpolated_points = tuple((x, poly(x))
                                for x in linspace(range_,
                                                  interpolated_points_number))

    make_compound_figure(real_points, interpolated_points).show()
