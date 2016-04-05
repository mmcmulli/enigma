require 'Minitest/autorun'
require 'Minitest/pride'
require '../lib/keygenerator'

class KeyGeneratorTest < Minitest::Test

def test_key_passed_into_generator
  k = KeyGenerator.new(88885)
  k.key
  assert "88885", "my key was not passed in properly"
end

def test_key_can_only_be_five_digits
  k = KeyGenerator.new(888886)

  assert_equal "Key can only have 5 digits", k.key_verify(k.key)
end


def test_key_needs_to_be_at_least_five_digits_fixes_if_not
  k = KeyGenerator.new(8884)

  assert_equal "08884", k.key
end

def test_first_two_digits_are_a_rotation
  k = KeyGenerator.new(12345)

  assert_equal "12", k.key[0..1]
end

def test_second_and_third_two_digits_are_b_rotation
  k = KeyGenerator.new(12345)

  assert_equal "23", k.key[1..2]
end

def test_third_and_fourth_two_digits_are_c_rotation
  k = KeyGenerator.new(12345)

  assert_equal "34", k.key[2..3]
end

def test_fourth_and_fith_two_digits_are_d_rotation
  k = KeyGenerator.new(12345)

  assert_equal "45", k.key[3..4]
end

end
