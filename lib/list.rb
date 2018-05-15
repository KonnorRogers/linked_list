module LinkedList

  # LinkedList implementation
  class List
      attr_accessor :name
      attr_reader :size, :head, :tail

    # Creates the linkedlist via List.new
    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end

    # Adds a node onto the end of the list
    def append(node)
      if @tail.nil? # Checks if the list is empty
        @head = node
        @tail = node
        @size += 1
      else
        @tail.next_node = node
        @tail = node
        @size += 1
      end
    end

    # Adds a node onto the front of the list
    def prepend(node)
      if head.nil? # Checks if the list is empty
        @head = node
        @tail = node
        @size += 1
      else
        node.next_node = @head
        @head = node
        @size += 1
      end
    end

    # Finds a node specificed at a specific index
    def at(index)
      return 'List is empty' if head.nil?
      return 'Index out of bounds' if index > (@size - 1)

      node_index = 0
      node = @head
      until node_index == index
        node = node.next_node
        node_index += 1
      end

      node
    end

    # similar to of Enumerable.each
    def iterate
      return nil if @head.nil?

      node = @head
      until node.nil?
        yield node
        node = node.next_node
      end
    end

    # Removes the last element in the list & returns the element
    def pop
      return nil if @head.nil?

      popped_node = @tail
      @tail.next_node = nil
      @size -= 1

      return popped_node
    end

    # Searches for the value entered to see if its in a node in the list
    def contains?(value)
      return false if @head.nil?

      node = @head
      # node.nil? must come first due to it being evaluated before node.value
      until node.nil? || node.value == value
        node = node.next_node
      end

      return false if node.nil?

      true
    end

    # Returns index of the first node that contains the given value
    def find(value)
      return nil if @head.nil?

      index = 0
      node = @head
      until node.nil? || node.value == value
        node = node.next_node
        index += 1
      end

      return nil if node.nil?
      index
    end

    # Returns a string for printing to console
    def to_s
      string = ""

      self.iterate do |node|
        string += "( #{node.value} ) -> " unless node.value.nil?
      end

      string += 'nil'
    end

    def insert_at(value, index)
      return 'Improper input' unless value.is_a?(Node)

      return list.prepend(value) if @head.nil?

      until
    end
  end
end