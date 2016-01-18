require 'rspec'
require './ToDoList.rb'

	describe "#ToDolist" do 
		before :each do 
		@object = Task.new
		@todo = TodoList.new
		10.times {@todo.tasks << Task.new} 
		end

		describe "#initialize" do 
			it "checks completed status" do 
				expect(@object.completed?).to eq(false)
			end
		end

		describe "#completed!" do 
			it "changes @completed to true" do
			expect(@object.completed!).to eq(true)
		end
	end

		describe "#make_incompleted!" do 
			it "changes @completed to false" do
			@todo.tasks[0].completed!
			expect(@todo.tasks[0].make_incomplete!).to eq(false)
		end
	end

		describe "#update_content!" do
			it "update @content" do
				expect(@object.update_content("Walk the milk")).to eq("Walk the milk")
			end
		end

		describe "add_task" do
			it "Add a task to our ToDoList" do
				expect(@todo.add_task(@object)).not_to eq([])
			end
		end

		describe "#delete_task" do
			it "Delete a task by his ID" do
				@todo.add_task(Task.new)
				expect(@todo.delete_task(64).length).to eq(10)
			end
		end

		describe "#find_task_by_id" do
			it "Find a task by ID" do
			# @todo.add_task(Task.new("Dale!"))
			expect(@todo.find_task_by_id(71)).to eq(@todo.tasks[0])
		end
	end

		describe "#find_task_by_id" do
			it "Find a task by ID" do
			expect(@todo.find_task_by_id(100000)).to eq(nil)
		end
	end

	describe "#sorted_by_created"
end

