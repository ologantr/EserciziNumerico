from cn.linear_algebra import jacobi, seidel
from cn.plot import make_compound_figure, make_plot_descriptor
import cn.vector


MATRICES = (
    (((3, 0, 4),
      (7, 4, 2),
      (-1, -1, -2)),
     (7, 13, -4)),

    (((-3, 3, -6),
      (-4, 7, -8),
      (5, 7, -9)),
     (-6, -5, 3)),

    (((4, 1, 1),
      (2, 9, 0),
      (0, -8, -6)),
     (6, -7, -14)),

    (((7, 6, 9),
      (4, 5, -4),
      (-7, -3, 8)),
     (22, 5, -2)),

    (((-4, -1, 1, 1),
      (0, -4, -1, 1),
      (-1, -1, 4, 1),
      (1, -1, 0, 4)),
     (-3, -4, 3, 4))
)


def analyze_error():
    matrix = MATRICES[0]
    steps = 100
    norm_fn = cn.vector.norm_inf

    jacobi_result = jacobi(matrix, steps)
    seidel_result = seidel(matrix, steps)

    jacobi_norms = tuple(norm_fn(result) for result in jacobi_result)
    seidel_norms = tuple(norm_fn(result) for result in seidel_result)

    jacobi_error = tuple((i, norm_fn(jacobi_norms[:i]))
                         for i in range(1, steps))
    seidel_error = tuple((i, norm_fn(seidel_norms[:i]))
                         for i in range(1, steps))

    make_compound_figure(
        make_plot_descriptor('Jacobi error', jacobi_error),
        make_plot_descriptor('Seidel error', seidel_error)
    ).show()
