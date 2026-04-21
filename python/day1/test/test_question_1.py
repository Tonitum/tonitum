#!/usr/bin/python3
import unittest
from question_one import NumberPicker

class TestQuestionOne(unittest.TestCase):
    def test_process(self):
        max_range = 40 
        min_range = 20
        res_list =  [7,14,21,28,42]

        picker = NumberPicker(min_range=1, max_range=42) 
        res = picker.process()

        self.assertIsNotNone(res, "Failed to return")
        self.assertIsInstance(res, str, "Failed to return string")

        res_split = res.split(",") 
        self.assertEqual(len(res_split), len(res_list))

        for i in range(len(res_split)):
            self.assertEqual(int(res_list[i]), int(res_split[i]))


if __name__ == "__main__":
    unittest.main(verbosity=2)

