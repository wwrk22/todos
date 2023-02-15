class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(new_todo_params)

    if @todo.save
      redirect_to todos_path, notice: "Added new todo"
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def new_todo_params
    params.require(:todo).permit(:title)
  end
end
