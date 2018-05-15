module LinkedList
  class Node
    attr_accessor :value, :next_node, :prev_node

    def initialize(value)
      @value = value
      @next_node = nil
      @prev_node = nil
    end
  end
end
