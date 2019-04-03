from typing import List

print("Selçuk")


def passing_example(a_list, an_int=2, a_string="A default string"):
    a_list.append("A new item")
    an_int = 4
    return a_list, an_int, a_string


mylist: List[int] = [1, 23, 85]
myist: int = 10
print(passing_example(mylist, myist))


# ------------ Class ------------

class MyClass(object):
    common = 10

    def __init__(self): self.myVariable = 3

    def myfunction(self, arg1: object, arg2: object) -> object:
        return self.myVariable

classinstance = MyClass()
classinstance2 = MyClass()
print(classinstance.myfunction(1,2))
print(classinstance.common)
print(classinstance2.common)
MyClass.common = 30
print(classinstance.common)
print(classinstance2.common)
# not working
MyClass.myVariable = 5
print(classinstance.myVariable)
print(classinstance2.myVariable)
classinstance.myVariable = 330780
print(classinstance.myVariable)
print(classinstance2.myVariable)


SUM = sum(0 for i in [3,5,7,9,4,3,7] if i == 7)
print(SUM)







