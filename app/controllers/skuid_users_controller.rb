class SkuidUsersController < ApplicationController

  before_action :init_user

  def index
    @SkdUser.all
  end

  def new
  end

  def create
    @animal = SkuidUser.new(check_params)

    if @animal.save
      redirect_to @animal, notice: "#{type} was successfully created."
    else
      render action: 'new'
    end
  end

  def show
  end

  def destroy
  end

  def update
  end

  private
    def init_user
      @SkdUser = SkuidUser.new(check_params)
    end

    def check_params
      params.require(@SkdUser.klass_name.underscore.to_sym).permit(:name, :type, :age)
    end

end
