class ProjectController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    categories = Category.select("id, title, NULL AS todos")

    render :json => categories, :include => [
      :todos => {:only => [:id, :text], :methods => :isCompleted}
    ]
  end

  def edit
    category = Category.find(params[:category_id])
    todo = Todo.find(params[:todo_id])
    if todo[:category_id] != category[:id]
      render :json => {:message => "Not found", :error => 404}, :status => 404
      return
    end

    if params.has_key?(:isCompleted)
      todo.update(is_completed: params[:isCompleted])
    end
    if params.has_key?(:text)
      todo.update(text: params[:text])
    end

    todo.save
  end
end

