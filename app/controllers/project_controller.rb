class ProjectController < ApplicationController
  def index
    categories = Category.select("id, title, NULL AS todos")

    render :json => categories, :include => [
      :todos => {:only => [:id, :text, :is_completed]}
    ]
  end
end
