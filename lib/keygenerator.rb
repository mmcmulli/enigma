require 'pry'
require 'date'

class KeyGenerator

  attr_reader :key, :a_rotation, :b_rotation, :c_rotation, :d_rotation, :key_verify, :date

  def initialize(key = rand(99999))
    @key = key.to_s
    @a_rotation = @key[0..1]
    @b_rotation = @key[1..2]
    @c_rotation = @key[2..3]
    @d_rotation = @key[3..4]
    key_verify(@key)
  end

  def key_verify(key)
    @key = ("%05d" % key) if @key.to_s.length < 5
    "Key can only have 5 digits" if @key.to_s.length > 5
  end



end
