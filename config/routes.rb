Rails.application.routes.draw do

  get 'projects' => 'project#getProjects'
  post 'todo' => 'todo#createTodo'
  patch 'todo/:todo_id' => 'todo#updateTodo'

end

