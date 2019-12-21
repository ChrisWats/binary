class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left=nil, right=nil)
    @payload = payload
    @left = left
    @right = right
  end

end

class BTreeSort
  @@argh = []

  def self.pushBranch(branch, value)
      if value > branch.payload
        if branch.right
          pushBranch(branch.right, value)
        else
          branch.right = BinaryTree.new(value)
        end
      else
        if branch.left
          pushBranch(branch.left, value)
        else
          branch.left = BinaryTree.new(value)
        end
      end
    end

  def self.sort(array)
    btree = BinaryTree.new(array[0])
    array.each_index do |i|
      if i != 0
        pushBranch(btree, array[i])
      end
    end
    return build_array(btree)
  end

  def self.build_array(tree)
    if tree == nil
      return @@argh
    end
      build_array(tree.left)
      @@argh << tree.payload
      build_array(tree.right)

      return @@argh
  end

end

# seven = BinaryTree.new(7, nil, nil)
# five  = BinaryTree.new(5, nil, nil)
# four  = BinaryTree.new(4, nil, nil)
# six   = BinaryTree.new(6, nil, seven)
# three = BinaryTree.new(3, nil, six)
# two   = BinaryTree.new(2, four, five)
# trunk = BinaryTree.new(1, two, three)

# array = [7, 4, 9, 1, 6, 14, 10]
# tree = BTreeSort.sort(array)
# puts tree.inspect
