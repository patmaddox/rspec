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
        alias_method :old_equality, :==

        def ==(other)
          other.is_a?(Bag) ? (other == self) : (old_equality(other))
        end
      end
    end
  end
end
