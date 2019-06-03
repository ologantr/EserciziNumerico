# Stop the iteration when the difference between the
# result of the current iteration and the previous
# one is less than TOLERANCE.
TOLERANCE = 1e-10

# Stop after MAX_ITERATIONS even if the result has not
# been found yet.
MAX_ITERATIONS = 500


def jacobi(matrix):
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

    for _ in range(MAX_ITERATIONS - 1):
        previous = result[-1]
        current = step(previous)

        differences = tuple(abs(a - b)
                            for a, b in zip(current, previous))

        if all(difference < TOLERANCE for difference in differences):
            # If we reach this code it means that we've
            # reached the tolerance.
            return tuple(result)
        else:
            result.append(step(result[-1]))
    # If we reach this code it means that we've reached
    # MAX_ITERATIONS.
    return tuple(result)


def seidel(matrix):
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

    for _ in range(MAX_ITERATIONS - 1):
        previous = result[-1]
        current = step(previous)

        differences = tuple(abs(a - b)
                            for a, b in zip(current, previous))
        if all(difference < TOLERANCE for difference in differences):
            # If we reach this code it means that we've
            # reached the tolerance.
            return tuple(result)
        else:
            result.append(step(result[-1]))

    # If we reach this code it means that we've reached
    # MAX_ITERATIONS.
    return tuple(result)
