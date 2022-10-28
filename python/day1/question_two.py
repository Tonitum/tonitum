#!/usr/bin/python3
'''
    Write a program which can compute the factorial of a given numbers. The 
    results should be printed in a comma-separated sequence on a single line.
    Suppose the following input is supplied to the program: 8 Then, the output 
    should be:40320
'''

class FactorialFinder():
    def __init__(self, target):
        self.target = target

    def calculate(self):
        val = 1
        for i in range(2, self.target+1):
            val = val * i
        return val

def main():
    target = 8
    finder = FactorialFinder(target)
    result = finder.calculate()
    print(f"Factorial of {target}: {result}")

if __name__ == "__main__":
    main()
