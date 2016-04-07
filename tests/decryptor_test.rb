require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_can_read_from_charactar_map
    decrypt = Decryptor.new

    assert_equal "a", decrypt.characters[0]
  end

  def test_can_read_the_key
    decrypt = Decryptor.new("message", 12345, 010416)

    assert_equal 12345, decrypt.key.key
  end

  def test_can_read_date
    decrpt = Decryptor.new("message")
  end
