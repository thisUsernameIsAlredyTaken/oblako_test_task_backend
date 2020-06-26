class TodosController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    category = Category.find_by title: todo_params[:category_title]
    if category == nil
      puts "category id null"
      category = Category.new(title: todo_params[:category_title])
      category.save
    end
    todo = Todo.new(title: todo_params[:title], is_completed: false, category_id: category[:id])
    todo.save
  end

  private def todo_params
    params.require(:todo).permit(:title, :category_title)
  end
end
