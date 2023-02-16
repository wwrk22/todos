class TodosController < ApplicationController
  before_action :authenticate

  def index
    @todos = Todo.all_for_user(session[:current_email])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params.merge(email: session[:current_email]))

    if @todo.save
      redirect_to todos_path, notice: "Added new todo"
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def todo_params
    params.require(:todo).permit(:title, :email)
  end
end
