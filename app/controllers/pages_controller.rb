class PagesController < ApplicationController
  def home
    @title = "Home"
    @micropost = Micropost.new if signed_in?
  end

  def contact
  end

  def help
  end

  def about
  end

end
