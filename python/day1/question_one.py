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

    def process(self) -> str:
        return_l = []
        for i in range(self.min, self.max + 1):
            # self documenting code who?
            divisible_by_5 = ((i % 5) == 0)
            divisible_by_7 = ((i % 7) == 0)
            if divisible_by_7 and not divisible_by_5:
                return_l.append(str(i))
        return ','.join(return_l)

if __name__ == "__main__":
    # picker = NumberPicker(2000, 3200)
    picker = NumberPicker(1, 42)
    res = picker.process()
    print(res)
