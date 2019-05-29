from cn.algebra import evaluate, linspace
from cn.interpolation import linear_interpolation
import cn.functions as fns

def e7_01():
    range_ = [-1, 1]
    real_points = evaluate(fns.fn_1, linspace(range_, 10))
    poly = linear_interpolation(real_points)
    interpolated_points = tuple((x, poly(x)) for x in linspace(range_, 100))
    return interpolated_points
