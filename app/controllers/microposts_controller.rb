class MicropostsController < ApplicationController
before_filter :authenticate, :only => [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micro-posted"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'

    end
  end


  def destroy
   @micropost.destroy
   redirect_back_or root_path 
  end

  #### not DRY, but code was failing to share with sessions_helper as specified in ApplicationController
  private
  def authorized_user
    @micropost = Micropost.find(params[:id])
    redirect_to root_path unless current_user?(@micropost.user)
  end

  def authenticate
    deny_access unless signed_in?
  end
end
