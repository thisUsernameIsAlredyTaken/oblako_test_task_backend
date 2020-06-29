class TodoController < ApplicationController
  # POST /todo
  def createTodo
    project_title = params.require(:project)
    todo_text = params.require(:todo)

    project = Project.find_by(title: project_title)
    if project == nil
      project = Project.create(title: project_title)
    end
    todo = Todo.create(text: todo_text, is_completed: false, project_id: project[:id])
    render :json => todo, :only => [:id, :project_id, :is_completed, :text]
  end

  # GET /projects
  def getProjects
    projects = Project.select("id, title").order("id ASC")

    render :json => projects, :include => [
      :todos => {:only => [:id, :text, :is_completed, :project_id]}
    ]
  end

  # PATCH /projects/:project_id/todos/:todo_id
  def updateTodo
    project = Project.find(params[:project_id])
    todo = Todo.find(params[:todo_id])
    if todo[:project_id] != project[:id]
      render :json => {:message => "Not found", :error => 404}, :status => 404
    else
      if params.has_key?(:is_completed)
        todo.update(is_completed: params[:is_completed])
      end
      if params.has_key?(:text)
        todo.update(text: params[:text])
      end
      todo.save
      render :json => todo, :only => [:id, :project_id, :is_completed, :text]
    end
  end
end

