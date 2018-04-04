class ProjectsController < ApplicationController

def new
 @project = Project.new
 @user = current_user
end

def create
  # render plain: params[:article].inspect
  #debugger # allows me to step though in server console
  @user = current_user
  @project = Project.new(project_params)
  @project.title_unique = "UN_" + @user.customer.id.to_s + "_" + @project.title
  @project.customer = @user.customer
#  @article.user = User.first
  if @project.save
    flash[:error] = 'Article was saved BOOM' # we added an enrty in application GHTML wrapper to use this
    redirect_to article_path(@article)
  else
    flash[:error] = 'Article was NOT BOOM'
    render :new
 end
end


private
def project_params
  params.require(:project).permit(:title, :description)
end


end
