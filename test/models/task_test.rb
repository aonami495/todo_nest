require "test_helper"

class TaskTest < ActiveSupport::TestCase
   test "is invalid without title" do
     task = Task.new(title: nil)
     assert_not task.valid?
     assert_includes task.errors[:title], "を入力してください"
   end

   test "with_status returns only matching tasks" do
     todo_task = tasks(:one) # status: todo
     doing_task = tasks(:two) # status: doing

     result = Task.with_status("todo")
     assert_includes result, todo_task
     assert_not_includes result, doing_task
   end

   test "with_status returns all tasks when given blank status" do
    assert_equal Task.all.to_a, Task.with_status(nil).to_a
    assert_equal Task.all.to_a, Task.with_status("").to_a
   end

   test "with_status returns all tasks when given invalid status" do
    assert_equal Task.all.to_a, Task.with_status("invalid_status").to_a
   end

   test "sorted falls back to created_at_desc for unknown sort key" do
     default = Task.sorted("created_at_desc").to_a
     unknown = Task.sorted("unknown_sort_key").to_a

     assert_equal default, unknown
     assert_equal [ tasks(:two), tasks(:one) ], unknown
   end
end
