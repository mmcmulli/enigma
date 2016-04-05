require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encryptor'
require_relative '../lib/char_map'

class EncryptionTest < Minitest::Test

  def test_character_map_starts_with_a
    map = Encryptor.new

    assert_equal "a", map.characters[0]
  end

  def test_character_map_loaded_numbers
    map = Encryptor.new

    assert_equal "0", map.characters[26]
  end

  def test_character_map_loaded_symbols
    map = Encryptor.new

    assert_equal ",", map.characters[-1]
  end

  def test_key_exists
    encrypt = Encryptor.new("message", 12345, 710416)

    assert_equal "12345", encrypt.key.key
  end

  def test_date_exists
    encrypt = Encryptor.new("message", 12345, 710416)   ###????

    assert_equal "710416", encrypt.date
  end

  def test_date_create_if_not_passed_in
    encrypt = Encryptor.new("message", 12345)

    new_date = Date.today
    today = new_date.strftime("%d") + new_date.strftime("%m") + new_date.strftime("%y")

    assert_equal today, encrypt.date
  end

  def test_a_offsets
    encrypt = Encryptor.new("message", "12345", "010416")

    assert_equal 15, encrypt.a_offset
  end

  def test_b_offsets
    encrypt = Encryptor.new("message", "12345", "010416")

    assert_equal 23, encrypt.b_offset
  end

  def test_c_offsets
    encrypt = Encryptor.new("message", "12345", "010416")

    assert_equal 39, encrypt.c_offset
  end

  def test_d_offsets
    encrypt = Encryptor.new("message", "12345", "010416")

    assert_equal 51, encrypt.d_offset
  end

  def test_encryption_works_for_one_letter
    encrypt = Encryptor.new("message", 12345, 010416)  #3056

    assert_equal 'p', encrypt.encryption('m')
  end

  # def test_encryption_works_for_whole_word
  #   encrypt = Encryptor.new("message", 12345, 010416)
  #
  # end
  #
  # def test_encryption_from_github
  #   encrypt = Encryptor.new("message ..end..", 12345, 010416)
  #
  # end
end
