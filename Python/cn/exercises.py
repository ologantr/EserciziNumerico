from cn.algebra import evaluate, linspace
from cn.interpolation import linear_interpolation
from cn.plot import make_compound_figure
import cn.functions as fns


def e7_01():
    range_ = [-1, 1]
    real_points_number = 10
    interpolated_points_number = 1000

    real_points = evaluate(fns.fn_1, linspace(range_, real_points_number))

    poly = linear_interpolation(real_points)
    interpolated_points = tuple((x, poly(x))
                                for x in linspace(range_,
                                                  interpolated_points_number))

    make_compound_figure(real_points, interpolated_points).show()
