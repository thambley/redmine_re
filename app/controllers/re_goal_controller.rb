class ReGoalController < RedmineReController
  unloadable
  menu_item :re

  def index
    @goals = ReGoal.find(:all,
                         :joins => :re_artifact_properties,
                         :conditions => {:re_artifact_properties => {:project_id => @project.id}}
    )
    render :layout => false if params[:layout] == 'false'
  end

  def new
    # redirects to edit to be more dry
    redirect_to :action => 'edit', :project_id => params[:project_id]
  end

  def edit
    @re_goal = ReGoal.find_by_id(params[:id], :include => :re_artifact_properties) || ReGoal.new
    @project ||= @re_goal.project
    # render html for tree
    @html_tree = create_tree
    if request.post?
      @re_goal.attributes = params[:re_goal]
      add_hidden_re_artifact_properties_attributes @re_goal

      flash[:notice] = t(:re_goal_successfully_saved) if save_ok = @re_goal.save

      redirect_to :action => 'edit', :id => @re_goal.id and return if save_ok
    end
  end

  def delete
  # deletes and updates the flash with either success, id not found error or deletion error
    @re_goal = ReGoal.find_by_id(params[:id], :include => :re_artifact_properties)
    if !@re_goal
      flash[:error] = 'Could not find a goal with this ' + params[:id] + ' to delete'
    else
      name = @re_goal.name
      if ReGoal.destroy(@re_goal.id)
        flash[:notice] = 'The Goal "' + name + '" has been deleted'
      else
        flash[:error] = 'The Goal "' + name + '" could not be deleted'
      end
    end
    redirect_to :controller => 'requirements', :action => 'index', :project_id => @project.id
  end

end
