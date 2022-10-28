#!/usr/bin/python3
import unittest
from python.day1.question_one import NumberPicker

class TestQuestionOne(unittest.TestCase):
    def _verify_list(self, expected, actual):
        self.assertEqual(len(expected), len(actual))
        for i in range(len(actual)):
            self.assertEqual(int(actual[i]), int(expected[i]))

    def test_process1(self):
        max_range = 40 
        min_range = 20
        res_list =  [7,14,21,28,42]

        picker = NumberPicker(min_range=1, max_range=42) 
        res = picker.process_1()

        self.assertIsNotNone(res, "Failed to return")
        self.assertIsInstance(res, str, "Failed to return string")
        res_split = res.split(",") 
        self._verify_list(res_list, res_split)

    def test_process2(self):
        max_range = 40 
        min_range = 20
        res_list =  [7,14,21,28,42]

        picker = NumberPicker(min_range=1, max_range=42) 
        res = picker.process_2()

        self.assertIsNotNone(res, "Failed to return")
        self.assertIsInstance(res, str, "Failed to return string")

        res_split = res.split(",") 
        self._verify_list(res_list, res_split)


if __name__ == "__main__":
    unittest.main(verbosity=2)

