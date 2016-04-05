require 'Minitest/autorun'
require 'Minitest/pride'
require_relative '../lib/offset_calculator'

class OffsetsTest <Minitest::Test


def test_key_passed_in
  calc = OffsetCalculator.new("12345", "010416")

  assert_equal "12345", calc.key
end

def test_date_format_passeed_in
  calc = OffsetCalculator.new("12345", "110416") # why when i pass in a zero first does this convert it???? 

  assert_equal "110416", calc.date
end

def test_it_can_square
  calc = OffsetCalculator.new("12345", "010416")

  assert_equal 108493056, calc.squared
end

#3056

def test_first_digit_is_a_offset
  digits = OffsetCalculator.new("12345", "010416")

  assert_equal 3, digits.a_offset(digits.squared)
end

def test_second_digit_is_b_offset
  digits = OffsetCalculator.new("12345", "010416")

  assert_equal 0, digits.b_offset(digits.squared)
end

def test_third_digit_is_c_offset
  digits = OffsetCalculator.new("12345", "010416")

  assert_equal 5, digits.c_offset(digits.squared)
end

def test_fourth_digit_is_d_offset
  digits = OffsetCalculator.new("12345", "010416")

  assert_equal 6, digits.d_offset(digits.squared)
end

def test_a_rotation_calculated_with_key
  calc = OffsetCalculator.new("12345", "010416")

  assert_equal 12, calc.a_rotation(calc.key)
end

def test_b_rotation_calculated_with_key
  calc = OffsetCalculator.new("12345", "010416")

  assert_equal 23, calc.b_rotation(calc.key)
end

def test_c_rotation_calculated_with_key
  calc = OffsetCalculator.new("12345", "010416")

  assert_equal 34, calc.c_rotation(calc.key)
end

def test_d_rotation_calculated_with_key
  calc = OffsetCalculator.new("12345", "010416")

  assert_equal 45, calc.d_rotation(calc.key)
end

def test_calculates_a_key_offset_combo
  calc = OffsetCalculator.new("12345", "010416")

  assert_equal 15, calc.a_combo
end

def test_calculates_b_key_offset_combo
  calc = OffsetCalculator.new("12345", "010416")

  assert_equal 23, calc.b_combo
end

def test_calculates_c_key_offset_combo
  calc = OffsetCalculator.new("12345", "010416")

  assert_equal 39, calc.c_combo
end

def test_calculates_d_key_offset_combo
  calc = OffsetCalculator.new("12345", "010416")

  assert_equal 51, calc.d_combo
end

end

# 3056
