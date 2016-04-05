require 'pry'
require 'date'
require_relative '../lib/keygenerator'
require '../lib/char_map'
require '../lib/offset_calculator'

class Encryptor

  attr_reader :characters, :key, :date, :message, :offsets

  def initialize(message = nil, key = rand(99999), date = Date.today)
    @key = KeyGenerator.new(key)
    @characters = CharMap.new.characters
    @date = date_format(date)
    @offsets = OffsetCalculator.new(key, date)
  end

  def date_format(date = Date.today)
    if date.class == Date
      date.strftime("%d%m%y")
    else
      date.to_s
    end
  end

  def a_offset
    @offsets.a_combo
  end

  def b_offset
    @offsets.b_combo
  end

  def c_offset
    @offsets.c_combo
  end

  def d_offset
    @offsets.d_combo
  end

  def encryption(message)
    standardize = message.downcase.chars

  end
# binding.pry

end
