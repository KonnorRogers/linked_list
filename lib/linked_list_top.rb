require_relative 'linked_list_top/version.rb'
require_relative 'linked_list_top/node.rb'
require_relative 'linked_list_top/list.rb'

# Linked list implementation as part of the odin project
module LinkedListTOP
  # Your code goes here...
  list = List.new

  list.prepend(Node.new(5))
  list.prepend(Node.new(6))
  list.prepend(Node.new(7))
  list.prepend(Node.new(8))

  puts list

  list.remove_at(1)

  puts list
end
