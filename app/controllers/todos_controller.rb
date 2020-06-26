class TodosController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    category = Category.find_by title: todo_params[:category_title]
    if category == nil
      category = Category.new(title: todo_params[:category_title])
      category.save
    end
    todo = Todo.new(text: todo_params[:text], is_completed: false, category_id: category[:id])
    todo.save
  end

  private def todo_params
    params.require(:todo).permit(:text, :category_title)
  end
end
