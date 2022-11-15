require 'todo_list'

RSpec.describe TodoList do
  context "initializes with nothing in it" do
    it "is an empty arry when calling incompolete" do
    todo_list = TodoList.new
    expect(todo_list.incomplete).to eq []
    end

    it "is an empty array when calling complete" do
      todo_list = TodoList.new
      expect(todo_list.complete).to eq []
    end

    it "is an empty array when calling complete, after give up" do
      todo_list = TodoList.new
      todo_list.give_up!
      expect(todo_list.complete).to eq []
    end
  end 
end