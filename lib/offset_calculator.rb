require 'pry'
require '../lib/keygenerator'
require 'date'


class OffsetCalculator

  attr_reader :date, :key, :squared

  def initialize(key = rand(99999), date = Date.today)
    @key = key
    @date = date_format(date)
    @squared = @date.to_i ** 2
  end

  def date_format(date)
    if date.class == Date
      date.strftime("%d%m%y")
    else
      date.to_s
    end
  end

  def a_offset(squared)
    squared.to_s[-4].to_i
  end

  def b_offset(squared)
    squared.to_s[-3].to_i
  end

  def c_offset(squared)
    squared.to_s[-2].to_i
  end

  def d_offset(squared)
    squared.to_s[-1].to_i
  end

  def a_rotation(key)
    key[0..1].to_i
  end

  def b_rotation(key)
    key[1..2].to_i
  end

  def c_rotation(key)
    key[2..3].to_i
  end

  def d_rotation(key)
    key[3..4].to_i
  end

  def a_combo
    a_offset(@squared.to_s) + a_rotation(@key.to_s)
  end

  def b_combo
    b_offset(@squared.to_s) + b_rotation(@key.to_s)
  end

  def c_combo
    c_offset(@squared.to_s) + c_rotation(@key.to_s)
  end

  def d_combo
    d_offset(@squared.to_s) + d_rotation(@key.to_s)
  end

end

# binding.pry
