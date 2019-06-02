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

    def x(previous, i):
        def sum_(i):
            return sum(a[i][j] * previous[j]
                       for j in range(order)
                       if j != i)

        return (b[i] - sum_(i)) / a[i][i]

    def step(previous):
        return tuple(x(previous, i)
                     for i in range(order))

    result = [step(b)]

    for _ in range(steps - 1):
        result.append(step(result[-1]))

    return tuple(result)


def seidel(matrix, steps):
    a, b = matrix
    order = len(a)

    def x(current, previous, i):
        def sum_1(current, i):
            return sum(a[i][j] * current[j]
                    for j in range(i - 1))

        def sum_2(previous, i):
            return sum(a[i][j] * previous[j]
                    for j in range(i + 1, order))

        return (b[i] - sum_1(current, i) - sum_2(previous, i)) / a[i][i]

    def step(previous):
        current = []

        for i in range(order):
            current.append(x(current, previous, i))

        return tuple(current)

    result = [step(b)]

    for _ in range(steps - 1 ):
        result.append(step(result[-1]))

    return tuple(result)
