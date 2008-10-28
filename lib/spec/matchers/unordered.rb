module Spec
  module Matchers

    class Bag
      def initialize(*items)
        @items = items
      end

      def ==(array)
        size = (@items && array).size
        size == @items.size && size == array.size
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
        alias_method :old_equality, :==

        def ==(other)
          other.is_a?(Bag) ? (other == self) : (old_equality(other))
        end
      end
    end
  end
end
