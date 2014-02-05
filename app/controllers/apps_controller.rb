class AppsController < ApplicationController
    
before_action :set_app, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

# GET /Apps
def index
    @apps = current_user.apps.order('created_at desc').page(params[:page])
end

# GET /Apps/1
def show
end

# GET /Apps/new
def new
    @app = current_user.apps.new
end

# GET /Apps/1/edit
def edit
end

# POST /Apps
def create
    @app = current_user.apps.new(app_params)
    
    if @app.save
        redirect_to @app, notice: 'App was successfully created.'
        else
        render action: 'new'
    end
end

# PATCH/PUT /Apps/1
def update
    if @app.update(app_params)
        redirect_to @app, notice: 'App was successfully updated.'
        else
        render action: 'edit'
    end
end

# DELETE /Apps/1
def destroy
    @app.destroy
    redirect_to apps_url, notice: 'App was successfully destroyed.'
end

private
# Use callbacks to share common setup or constraints between actions.
def set_app
    unless @app = current_user.apps.where(id: params[:id]).first
        flash[:alert] = 'App not found.'
        redirect_to root_url
    end
end


def app_params
    params.require(:app).permit(:name, :version, :user_id)
end

end