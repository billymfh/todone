require 'test_helper'

class ListItemTest < ActiveSupport::TestCase
  def setup
    @list_item = list_items(:valid_task)
  end

  test "valid list item" do
    assert @list_item.valid?, 'invalid list item'
  end

  test "should not be able to create a list item without a task" do
    @list_item.task = nil
    refute @list_item.valid?, 'list item is valid without a task'
    assert_not_nil @list_item.errors[:task], 'no validation error for missing task'
  end 
end
