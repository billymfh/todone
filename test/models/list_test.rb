require 'test_helper'

class ListTest < ActiveSupport::TestCase
  def setup
    @list = lists(:valid_list)
  end

  test "valid list" do
    assert @list.valid?, 'invalid list'
  end

  test "should not be able to create a list without a user" do
    @list.user = nil
    refute @list.valid?, 'list is valid without a user'
    assert_not_nil @list.errors[:user], 'no validation error for missing user'
  end 

  test "should not be able to create a list without a name" do
    @list.name = nil
    refute @list.valid?, 'list is valid without a name'
    assert_not_nil @list.errors[:name], 'no validation error for missing name'
  end 
end
