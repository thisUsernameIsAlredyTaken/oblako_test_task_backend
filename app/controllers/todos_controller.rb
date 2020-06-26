class TodosController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    category_title = params.require(:category_title)
    text = params.require(:text)

    category = Category.find_by title: category_title
    if category == nil
      category = Category.new(title: category_title)
      category.save
    end
    todo = Todo.new(text: text, is_completed: false, category_id: category[:id])
    todo.save
  end
end

