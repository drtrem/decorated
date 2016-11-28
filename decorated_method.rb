require './decorators.rb'

class C
  include Decorators

  add_prefix('hello ')
  def a
    'from a'
  end

  def b
    'from b'
  end
end

p C.new.a # 'hello from a'
p C.new.b # 'from b'