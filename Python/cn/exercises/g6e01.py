from cn.linear_algebra import jacobi, seidel
from cn.plot import make_simple_figure
import cn.vector


MATRICES = (
    (((3, 0, 4),       # Solution: (1, 1, 1)
      (7, 4, 2),       # Jacobi CAN'T solve
      (-1, -1, -2)),   # Seidel CAN'T solve
     (7, 13, -4)),

    (((-3, 3, -6),     # Solution: (1, 1, 1)
      (-4, 7, -8),     # Jacobi CAN   solve
      (5, 7, -9)),     # Seidel CAN'T solve
     (-6, -5, 3)),

    (((4, 1, 1),       # Solution: (0.83, -0.96, 3.61)
      (2, 9, 0),       # Jacobi CAN   solve
      (0, -8, -6)),    # Seidel CAN'T solve. Stops at second step
     (6, -7, -14)),

    (((7, 6, 9),       # Solution: (1, 1, 1)
      (4, 5, -4),      # Jacobi CAN   solve
      (-7, -3, 8)),    # Seidel CAN'T solve
     (22, 5, -2)),

    (((-4, -1, 1, 1),  # Solution: (1, 1, 1, 1)
      (0, -4, -1, 1),  # Jacobi CAN   solve
      (-1, -1, 4, 1),  # Seidel CAN'T solve
      (1, -1, 0, 4)),
     (-3, -4, 3, 4))
)


def analyze_error():
    matrix = MATRICES[0]
    norm_fn = cn.vector.norm_inf

    jacobi_result = jacobi(matrix)
    seidel_result = seidel(matrix)

    # Difference between the result of the k-th iteration
    # and the previous iteration.
    jacobi_differences = tuple(norm_fn(b) - norm_fn(a)
                               for a, b in zip(jacobi_result[:-1],
                                               jacobi_result[1:]))
    seidel_differences = tuple(norm_fn(b) - norm_fn(a)
                               for a, b in zip(seidel_result[:-1],
                                               seidel_result[1:]))

    # Ratio between each difference and the result of the
    # last iteration which should, in theory, be the
    # correct result.
    jacobi_error = tuple(difference / norm_fn(jacobi_result[-1])
                         for difference in jacobi_differences)
    seidel_error = tuple(difference / norm_fn(seidel_result[-1])
                         for difference in seidel_differences)

    # Tuples in the form of (x, y) so that we can plot the
    # error.
    jacobi_points = tuple(zip(range(len(jacobi_error)),
                              jacobi_error))
    seidel_points = tuple(zip(range(len(seidel_error)),
                              seidel_error))

    make_simple_figure(jacobi_points, title='Jacobi').show()
    make_simple_figure(seidel_points, title='Seidel').show()
