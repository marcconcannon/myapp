class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show] # this is stating that is should run the set_user command bfore edit update and show commans are used

  def set_user # this is a method we created to remove having the same code in lots of functions
    @user = User.find(params[:id])
  end

  def new
    if(logged_in?)
      redirect_to welcomeNewCustomer_path
    else
    @user = User.new
    end
  end

  def create
    # render plain: params[:article].inspect
    # debugger # allows me to step though in server console
    @user = User.new(user_params)
    @customer = Customer.getCustomer(user_params)

    #domain = @user.email.split('@').last
    #if (@customer = Customer.where(domain: domain).first).present?

    #else
    #  @customer = Customer.new
    #  @customer.name = domain
    #  @customer.domain = domain
  #    @customer.plan_id = 1
    #  @customer.plan_modified_date = DateTime.now.to_date
    #  if @customer.save
    #    flash[:notice] = 'New customer was created BOOM!' # we added an enrty in application GHTML wrapper to use this
    #   end
    #  end

    @user.customer = @customer
    @user.is_owner = true
    @user.is_admin = true
    #  @article.user = User.first

    puts("about to save #{@user.customer.plan.name}")

    if @user.save
      flash[:notice] = 'User was created BOOM' # we added an enrty in application GHTML wrapper to use this
      session[:user_id] = @user.id
      session[:boom] = 'boom111'
      redirect_to welcomeNewCustomer_path
    else
      render :new
   end
  end

  def newCustomer
    render :welcomeNewCustomer

  end


  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.all
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User was updtaed BOOM' # we added an enrty in application GHTML wrapper to use this
      redirect_to articles_path
    else
      render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :firstname, :lastname)
  end

  def getCustomerDetails; end
end
