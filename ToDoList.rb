
class Task
    attr_reader :content, :id, :completed
    @@current_id = 1
    def initialize(content = "dog")
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed = false
        @created_at = Time.new
        @updated_at = nil
    end

    def completed?
    	@completed
    end
    	
    def completed!
    	@completed = true
    end

    def make_incomplete!
    	@completed = false
    end

    def update_content(new_content)
    	log_update
    	@content = new_content
    end

    def log_update
        @updated_at = Time.new
    end


end

# class TodoList

#     attr_reader :tasks
#     def initialize(user)
#         @tasks = []
#         @user = user
#     end

#     def add_task(task)
#     	@tasks << task 
#     end

#     def delete_task(id)
#     	@tasks.delete_if{|task| task.id == id}
#     end

#     def find_task_by_id(id)
#     	n = @tasks.find_index {|item| item.id == id}
#     	if n == nil
#     		puts "nil!"
#     	else
#     	tasks[n]
#     	end
#     end
# end


# todo_list = TodoList.new
# todo_list.add_task(Task.new("Walk the dog"))
# todo_list.add_task(Task.new("Buy the milk"))
# task = todo_list.find_task_by_id(1)
# puts task.content
# puts task.id



