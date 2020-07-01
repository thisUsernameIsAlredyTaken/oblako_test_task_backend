class ProjectController < ApplicationController
  # GET /projects
  def getProjects
    projects = Project.all

    render :json => projects, :only => [:id, :title], :include => [
        :todos => {:only => [:id, :text, :is_completed, :project_id]}
        ]
  end
end
