from math import sin


def fn_1(x):
    return 1/(1 + (25 * (x ** 2)))


def fn_2(x):
    return x/(1 + (x ** 2))


def fn_3(x):
    return abs(x)


def fn_4(x):
    return sin(x) / x
