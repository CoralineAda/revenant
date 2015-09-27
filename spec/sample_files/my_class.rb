class MyClass < MySuperclass

  include my_module
  extend my_module

  macro :set_defaults

  def self.setup
  end

  def initialize
  end

  def do_something
    puts "OK"
  end

end