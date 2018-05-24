require 'linked_list_top/list.rb'
require 'linked_list_top/node.rb'

module LinkedListTOP
  RSpec.describe List do
    context '#initialize' do
      it 'Creates a linked list w/ no arguments given' do
        expect(List.new).to be_an_instance_of(List)
      end

      it 'Sets head to nil' do
        expect(List.new.head).to eq(nil)
      end

      it 'Sets tail to nil' do
        expect(List.new.tail).to eq(nil)
      end

      it 'Sets size to 0' do
        expect(List.new.size).to eq(0)
      end
    end

    node1 = Node.new(5)
    node2 = Node.new(12)

    context '#append' do
      it 'Adds a value onto the end of the list' do
        list = List.new

        list.append(node1)
        list.append(node2)
        expect(list.head).to eq(node1)
        expect(list.tail).to eq(node2)
      end
    end

    context '#prepend' do
      it 'Adds a value onto the beginning of the list' do
        list = List.new
        list.prepend(node1)
        list.prepend(node2)

        expect(list.head).to eq(node2)
        expect(list.tail).to eq(node1)
      end
    end

    context '#size' do
      it 'Returns 2 when 2 nodes added.' do
        list = List.new
        list.prepend(node1)
        list.prepend(node2)

        expect(list.size).to eq(2)
      end

      it 'Returns 0 when no nodes in the list.' do
        list = List.new
        expect(list.size).to eq(0)
      end
    end

    context '#head' do
      it 'Returns the head node of the list.' do
        list = List.new
        list.prepend(node1)
        list.prepend(node2)

        expect(list.head).to eq(node2)
      end

      it 'Returns nil if no nodes in the list' do
        list = List.new
        expect(list.head).to eq nil
      end
    end

    context '#tail' do
      it 'Returns the tail node of the list' do
        list = List.new
        list.append(node1)
        list.append(node2)

        expect(list.tail).to eq(node2)
      end

      it 'Returns nil if no nodes in the list' do
        list = List.new
        expect(list.tail).to eq(nil)
      end
    end

    context '#at(index)' do
      it 'Returns the node @ the given index' do
        list = List.new

        node01 = Node.new(5)
        node02 = Node.new(6)
        node03 = Node.new(7)

        list.append(node01)
        list.append(node02)
        list.append(node03)

        expect(list.at(1)).to eq(node02)
      end

      it "Returns 'Index out of bounds' if index is > (size - 1)" do
        list = List.new

        node01 = Node.new(5)
        node02 = Node.new(6)
        node03 = Node.new(7)

        list.append(node01)
        list.append(node02)
        list.append(node03)

        expect(list.at(3)).to eq('Index out of bounds')
      end

      it "Returns 'List is empty' if @head.nil?" do
        list = List.new
        expect(list.at(2)).to eq('List is empty')
      end
    end

    context '#iterate' do
      it 'Iterates through the whole list until it reaches the tail.' do
        list = List.new

        node01 = Node.new(5)
        node02 = Node.new(6)
        node03 = Node.new(7)
        node04 = Node.new(8)

        list.prepend(node01)
        list.prepend(node02)
        list.prepend(node03)
        list.prepend(node04)

        ary_of_nodes = []

        list.iterate { |node| ary_of_nodes << node }

        expect(ary_of_nodes.size).to eq(4)
        expect(ary_of_nodes[1]).to eq(node03)
        expect(ary_of_nodes[0]).to eq(node04)
      end

      it 'expects 2nd item to equal 2' do
        list = List.new

        list.prepend(Node.new(2))
        list.prepend(Node.new(5))

        ary_of_indexes = []

        list.iterate { |_node, index| ary_of_indexes << index }

        expect(ary_of_indexes[0]).to eq(0)
        expect(ary_of_indexes[1]).to eq(1)
      end
    end

    context '#pop' do
      it 'returns the popped node' do
        list = List.new

        node01 = Node.new(5)
        node02 = Node.new(7)

        list.append(node01)
        list.append(node02)

        expect(list.pop).to eq(node02)
      end

      it 'Updates size of the list' do
        list = List.new

        node01 = Node.new(5)
        node02 = Node.new(7)

        list.append(node01)
        list.append(node02)

        list.pop

        expect(list.size).to eq(1)
      end

      it 'Returns nil if no values in the list' do
        list = List.new

        expect(list.pop).to eq(nil)
      end
    end

    context '#contains?(value)' do
      it 'Returns the value of 5 if the list contains a node w/ value 5.' do
        list = List.new

        node01 = Node.new(5)
        node02 = Node.new(6)
        node03 = Node.new(7)
        node04 = Node.new(8)

        list.prepend(node01)
        list.prepend(node02)
        list.prepend(node03)
        list.prepend(node04)

        expect(list.contains?(5)).to eq(true)
      end

      it 'Returns false if none of the nodes contain a value of 5.' do
        list = List.new

        node01 = Node.new(2)
        node02 = Node.new(6)
        node03 = Node.new(7)
        node04 = Node.new(8)

        list.prepend(node01)
        list.prepend(node02)
        list.prepend(node03)
        list.prepend(node04)

        expect(list.contains?(5)).to eq(false)
      end

      it 'Returns false if the list is empty.' do
        list = List.new

        expect(list.contains?(12)).to eq(false)
      end
    end

    context '#find(value)' do
      it 'Returns the index of the first node with the given value' do
        list = List.new

        node01 = Node.new(5)
        node02 = Node.new(6)
        node03 = Node.new(7)
        node04 = Node.new(8)

        list.prepend(node01)
        list.prepend(node02)
        list.prepend(node03)
        list.prepend(node04)

        expect(list.find(7)).to eq(1)
      end

      it 'Returns nil if the value is not found' do
        list = List.new

        node01 = Node.new(5)
        list.prepend(node01)

        expect(list.find(4)).to eq(nil)
      end

      it 'Returns nil if the list is empty' do
        list = List.new

        expect(list.find(4)).to eq(nil)
      end
    end

    context '#to_s' do
      it 'Returns a string in the format ( data ) -> ( data ) -> nil' do
        list = List.new

        list.append(Node.new(5))
        list.append(Node.new(10))
        list.append(Node.new(15))

        expect(list.to_s).to eq('( 5 ) -> ( 10 ) -> ( 15 ) -> nil')
      end

      it "Returns 'nil' if the list is empty." do
        list = List.new

        expect(list.to_s).to eq('nil')
      end
    end

    it 'Will insert the value at the index and the linked_list will continue' do
      list = List.new

      list.prepend(Node.new(1))
      list.append(Node.new(2))

      list.insert_at(Node.new(3), 1)

      expect(list.at(1).value).to eq(3)
      expect(list.at(2).value).to eq(2)
      expect(list.at(0).value).to eq(1)
    end

    it 'Updates the size of the list' do
      list = List.new

      list.prepend(Node.new(1))
      list.insert_at(Node.new(0), 0)
      expect(list.size).to eq(2)
    end

    it 'Properly inserts if inserted @ 0' do
      list = List.new

      list.prepend(Node.new(0))
      list.insert_at(Node.new(1), 0)
      expect(list.at(0).value).to eq(1)
    end

    it 'Inserts properly @ 1' do
      list = List.new

      list.prepend(Node.new(0))
      list.insert_at(Node.new(1), 1)

      expect(list.at(1).value).to eq(1)
    end
  end
  context '#insert_at(value, index)' do
    it 'Returns Improper input if the value is not a node' do
      list = List.new
      expect(list.insert_at(5, 2)).to eq('Improper input')
    end

    it 'Inserts the value at the head if value == 0 && head == nil' do
      list = List.new
      node01 = Node.new(5)

      list.insert_at(node01, 0)
      expect(list.at(0)).to eq(node01)
    end

    it 'Will insert the value at the index and the linked_list will continue' do
      list = List.new

      list.prepend(Node.new(1))
      list.append(Node.new(2))

      list.insert_at(Node.new(3), 1)

      expect(list.at(1).value).to eq(3)
      expect(list.at(2).value).to eq(2)
      expect(list.at(0).value).to eq(1)
    end

    it 'Updates the size of the list' do
      list = List.new

      list.prepend(Node.new(1))
      list.insert_at(Node.new(0), 0)
      expect(list.size).to eq(2)
    end

    it 'Properly inserts if inserted @ 0' do
      list = List.new

      list.prepend(Node.new(0))
      list.insert_at(Node.new(1), 0)
      expect(list.at(0).value).to eq(1)
    end

    it 'Inserts properly @ 1' do
      list = List.new

      list.prepend(Node.new(0))
      list.insert_at(Node.new(1), 1)

      expect(list.at(1).value).to eq(1)
    end
  end

  context '#remove_at(index)' do
    it 'Returns index out of bounds if < 0' do
      list = List.new

      expect(list.remove_at(-1)).to eq('Index out of bounds')
    end

    it 'Returns index out of bounds if index > @size - 1' do
      list = List.new
      list.prepend(Node.new(5))

      expect(list.remove_at(1)).to eq('Index out of bounds')
    end

    it 'sets head to nil if only 1 value in the list' do
      list = List.new

      list.prepend(Node.new(5))
      list.remove_at(0)

      expect(list.head).to eq(nil)
      expect(list.tail).to eq(nil)
    end

    it 'Removes item at the start' do
      list = List.new

      node01 = Node.new(1)
      node02 = Node.new(2)

      list.prepend(node01)
      list.prepend(node02)

      list.remove_at(0)

      expect(list.at(0)).to eq(node01)
    end

    it 'Removes item in middle' do
      list = List.new

      node01 = Node.new(1)
      node02 = Node.new(2)
      node03 = Node.new(3)

      list.prepend(node01)
      list.prepend(node02)
      list.prepend(node03)

      list.remove_at(1)

      expect(list.at(0)).to eq(node03)
      expect(list.at(1)).to eq(node01)
    end
    it 'Removes item at end' do
      list = List.new

      node01 = Node.new(1)
      node02 = Node.new(2)

      list.prepend(node01)
      list.prepend(node02)

      list.remove_at(1)

      expect(list.at(0)).to eq(node02)
      expect(list.at(1)).to eq('Index out of bounds')
    end

    it 'Updates size accordingly' do
      list = List.new

      node01 = Node.new(1)
      node02 = Node.new(2)

      list.prepend(node01)
      list.prepend(node02)

      list.remove_at(0)

      expect(list.size).to eq(1)
    end
  end
end
