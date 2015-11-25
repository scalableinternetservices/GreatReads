class HomeController < ApplicationController
  def index
  	#@feed = current_user.get_feed
  	 @feed = current_user.get_feed.paginate(:page => params[:page], :per_page => 4)
  end
end
