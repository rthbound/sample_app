class MicropostsController < ApplicationController
before_filter :authenticate, :only => [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micro-posted"
      redirect_to root_path
    else
      render 'pages/home'

    end
  end


  def destroy

  end

  #### not DRY, but code was failing to share with sessions_helper as specified in ApplicationController
  private
  def authenticate
    deny_access unless signed_in?
  end
end
