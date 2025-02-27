

def sumx (a, b):
    return a + b


def divide(a, b):
    if b == 0:
        raise ZeroDivisionError
    return a / b


print(sumx(4, 2))