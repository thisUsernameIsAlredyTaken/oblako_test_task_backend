class TodoController < ApplicationController
  # POST /todo
  def createTodo
    project_title = params.require(:project)
    todo_text = params.require(:todo)

    todo = Todo.new(text: todo_text, is_completed: false)

    if todo.valid?
      project = Project.find_or_create_by(title: project_title)

      if project.valid?
        todo.project = project
        todo.save
        render :json => todo, :only => [:id, :project_id, :is_completed, :text]
        return
      end
    end

    render :json => { :message => "<project>'s length must be greater than 1 and less than 40." \
                                  " <todo>'s length must be greater than 1 and less than 140" },
                      :status => 422
  end

  # PATCH /todo/:todo_id
  def updateTodo
    todo = Todo.find(params[:todo_id])
    if params.has_key?(:is_completed)
      todo.update(is_completed: params[:is_completed])
    end
    render :json => todo, :only => [:id, :project_id, :is_completed, :text]
  end
end
