from math import sqrt


def norm_1(v):
    return sum(abs(x) for x in v)


def norm_2(v):
    return sqrt(sum(x ** 2 for x in v))


def norm_inf(v):
    return max(abs(x) for x in v)
