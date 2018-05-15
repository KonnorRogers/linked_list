require 'node'
include LinkedList

RSpec.describe Node do
	context "#initialize" do
		it "Creates a new node if valid input given." do
			expect(Node.new(0).value).to eq 0
		end

		it "Will not create a node if no input given" do
			expect{Node.new}.to raise_error(ArgumentError)
		end
	end

	context "#value" do
		it "Assigns a value if input given." do
			expect(Node.new(5).value).to eq(5)
		end

		it "Sets to nil if self.value = nil" do
			node = Node.new(5)
		  node.value = nil
		  expect(node.value).to eq(nil)
		end
	end

	context "#next_node" do
		it "Assigns a node to @next_node." do
			node = Node.new(5)
			node2 = Node.new(8)
			node.next_node = node2

			expect(node.next_node).to eq(node2)
		end

		it "Has a nil value if no @next_node given" do
			node = Node.new(10)
			expect(node.next_node).to eq(nil)
		end
	end

	context "#prev_node" do
		it "Assigns a new node to the previous node." do
			node = Node.new(10)
			node1 = Node.new(5)

			node1.prev_node = node

			expect(node1.prev_node).to eq(node)
		end

		it "Returns nil if no previous node found" do
			node = Node.new(5)

			expect(node.prev_node).to eq(nil)
		end
	end
end
