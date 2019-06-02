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


def jacobi(matrix, steps):
    a, b = matrix
    order = len(a)

    def step(previous, i):
        def sum_(i):
            return sum(a[i][j] * previous[j]
                       for j in range(order)
                       if j != i)

        def x(i):
            return (b[i] - sum_(i)) / a[i][i]

        return x(i)

    def result(previous):
        return tuple(step(previous, i)
                     for i in range(order))

    r = [result(b)]

    for _ in range(steps - 1):
        r.append(result(r[-1]))

    return tuple(r)
