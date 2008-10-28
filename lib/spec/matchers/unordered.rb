module Spec
  module Matchers

    class Bag
      def initialize(*items)
        @items = items
      end

      def ==(array)
        (@items && array).size == @items.size
      end

      def inspect
        @items.inspect
      end
    end

    def unordered(*args)
      Bag.new(*args)
    end

    def self.included(klass)
      Array.class_eval do
        old_equality = instance_method(:==)

        define_method(:==) do |other|
          other.is_a?(Bag) ? (other == self) : old_equality.bind(self)[other]
        end
      end
    end
  end
end
