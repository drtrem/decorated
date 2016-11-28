module Decorators
  def self.included(klass)
    klass.extend DecoratorsMethod
  end

  module DecoratorsMethod
    def add_prefix (str)
      @adding_method = false
      @str = str
    end

    def method_added(method)
      return if @adding_method
      @adding_method = true
      str = @str
      alias_method "orig_#{method}", method
      define_method method do |*args, &block|
        str + send("orig_#{method}", *args, &block)
      end
    end
  end
end