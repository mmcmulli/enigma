require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

## need a way to test cracking it from known message first? 

def test_integrated_encryption
  Enigma.new("message..end..", 12345, 010416).encrypt

  assert " "
end

def test_integrated_decryption
  Enigma.new("message..end..", 12345, 010416).encrypt

  assert " "
end

def test_integrated_decrypt
  Enigma.new("message..end..", 12345, 010416).encrypt

  assert " "
end
