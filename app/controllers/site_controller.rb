class SiteController < ApplicationController
  def index
      if current_user
          @current_user.apps = current_user.apps.order('created_at desc').page(params[:page])
        
        else
        
        @apps = App.order('created_at desc').page(params[:page])
        end
  end
end
