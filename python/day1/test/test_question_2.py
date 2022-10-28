#!/usr/bin/python3
import unittest
from python.day1.question_two import FactorialFinder 

class TestQuestionTwo(unittest.TestCase):
    def test_process(self):
        target = 8
        expected = 40320
        finder = FactorialFinder(target)
        result = finder.calculate()
        self.assertEqual(expected, result)

if __name__ == "__main__":
    unittest.main(verbosity=2)

