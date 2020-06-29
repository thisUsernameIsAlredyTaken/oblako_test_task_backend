Rails.application.routes.draw do

  get 'projects' => 'todo#getProjects'
  post 'todo' => 'todo#createTodo'
  patch 'projects/:project_id/todos/:todo_id' => 'todo#updateTodo'

end

