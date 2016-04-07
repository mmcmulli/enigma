require 'pry'
require 'date'
require '../lib/keygenerator'
require '../lib/char_map'
require '../lib/offset_calculator'

class Encryptor

  attr_reader :characters, :key, :date, :message, :offsets

  def initialize(message = nil, key = rand(99999), date = Date.today)
    @key = KeyGenerator.new(key)
    @characters = CharMap.new.characters 
    @date = (date_format(date))
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
    counter = -1
    encrypt = standardize.map do |letter|
      if counter == 0
        ((@characters.index(letter) + a_offset) % 39)
      elsif counter == 1
        ((@characters.index(letter) + b_offset) % 39)
      elsif counter == 2
        ((@characters.index(letter) + c_offset) % 39)
      elsif counter == 3
        ((@characters.index(letter) + d_offset) % 39)
      else
        "message not properly encrypted"
      end
    encrypt.join
    end
  end
end
# binding.pry
