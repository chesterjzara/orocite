class ArgumentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def create
    @argument = current_user.arguments.build(argument_params)
    if @argument.save
      flash[:success] = "Argument created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @argument.destroy
    redirect_to root_url
  end

  def show
    @argument = Argument.find(params[:id])
    @ideas = @argument.ideas
  end

  private

    def argument_params
      params.require(:argument).permit(:topic)
    end

    def correct_user
      @argument = current_user.arguments.find_by(id: params[:id])
      redirect_to root_url if @argument.nil?
    end
end
