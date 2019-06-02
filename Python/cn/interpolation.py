from cn.arithmetic import product


def linear_interpolation(points):
    """
    Return an interpolation function for the given points.

    >>> fn = linear_interpolation(((0, 0), (1, 1)))
    >>> fn(2)
    2.0

    >>> fn = linear_interpolation(((0, 0), (1, 1), (2, 4)))
    >>> fn(3)
    9.0
    """
    xs, ys = tuple(zip(*points))
    n = len(points)

    def basis(j):
        def numerator(x, i):
            return x - xs[i]

        def denominator(j, i):
            return xs[j] - xs[i]

        def fn(x):
            return product(numerator(x, i) / denominator(j, i)
                           for i in range(n)
                           if i != j)

        return fn

    bases = tuple(basis(j) for j in range(n))

    def fn(x):
        return sum(y * base(x)
                   for y, base in zip(ys, bases))

    return fn
