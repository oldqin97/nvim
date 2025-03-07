import math


def test():
    print("hello world")

    content = dir(math)

    class A:
        def __init__(self, a):
            self.a = a

        def __str__(self):
            return self.a

    a = A("hello")
    print(a)


test()
