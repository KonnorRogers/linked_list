require 'linked_list_top/node.rb'

module LinkedListTOP
  RSpec.describe Node do
    context '#initialize' do
      it 'Creates a new node if valid input given.' do
        expect(Node.new(0).value).to eq 0
      end

      it 'Will not create a node if no input given' do
        expect { Node.new }.to raise_error(ArgumentError)
      end

      context '#value' do
        it 'Assigns a value if input given.' do
          expect(Node.new(5).value).to eq(5)
        end

        it 'Sets to nil if self.value = nil' do
          node = Node.new(5)
          node.value = nil
          expect(node.value).to eq(nil)
        end
      end

      context '#next_node' do
        it 'Assigns a node to @next_node.' do
          node = Node.new(5)
          node2 = Node.new(8)
          node.next_node = node2

          expect(node.next_node).to eq(node2)
        end

        it 'Has a nil value if no @next_node given' do
          node = Node.new(10)
          expect(node.next_node).to eq(nil)
        end
      end
    end
  end
end
