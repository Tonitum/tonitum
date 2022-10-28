#!/usr/bin/python3
'''
    Write a program which will find all such numbers which are divisible by 7
    but are not a multiple of 5, between 2000 and 3200 (both included). The
    numbers  obtained should be printed in a comma-separated sequence
    on a single line.
'''

class NumberPicker():
    def __init__(self, min_range=2000, max_range=3200):
        self.min = min_range
        self.max = max_range

    def process_1(self) -> str:
        return_l = []
        for i in range(self.min, self.max + 1):
            if self._divisible_by_7(i) and not self._divisible_by_5(i):
                return_l.append(str(i))
        return ','.join(return_l)

    def _divisible_by_5(self, target):
        return ((target % 5) == 0)

    def _divisible_by_7(self, target):
        return ((target % 7) == 0)

    def process_2(self) -> str:
        # this uses list comprehensions
        return_l = [str(i) for i in range(self.min, self.max + 1)
                if not self._divisible_by_5(i) and self._divisible_by_7(i)]
        return ','.join(return_l)


if __name__ == "__main__":
    picker = NumberPicker(1, 42)
    res1 = picker.process_1()
    res2 = picker.process_2()
    print(res1)
    print(res2)
