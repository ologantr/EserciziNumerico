from cn.arithmetic import product

def linear_interpolation(points):
    xs, ys = tuple(zip(*points))
    n = len(points)

    # π(x) = (x - x₀) ··· (x - xₙ)
    def pi(x):
        return product((x - x_n) for x_n in xs)

    #           yⱼ
    # zⱼ = -------------
    #       n
    #       ∏   (xⱼ - xᵢ)
    #      i=0
    #      i≠j
    def z(j):
        def numerator():
            return ys[j]

        def denominator():
            return product(xs[j] - xs[i]
                           for i in range(n)
                           if i != j)

        return numerator() / denominator()

    #  n      zⱼ
    #  ∑    ------
    # j=0   x - xⱼ
    def sum_(x):

        def numerator(j):
            return z(j)

        def denominator(j):
            return x - xs[j]

        return sum(numerator(j) / denominator(j)
                   for j in range(n))

    #              n     zⱼ
    # p(x) = π(x)  ∑   ------
    #             j=0  x - xⱼ
    def fn(x):
        return pi(x) * sum_(x)

    return fn
