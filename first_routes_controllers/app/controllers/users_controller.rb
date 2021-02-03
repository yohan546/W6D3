class UsersController < ApplicationController 
    def index 
        users = User.all
        render json: users
        # render plain: "I'm in the index action!"
    end

    def create 
        # render json: params
        user = User.new(params.require(:user).permit(:name,:email))
        # replace the `user_attributes_here` with the actual attribute keys
        user.save!
        render json: user
    end

    def show 
        # user = User.find(params[:id])
        # render json: user
        render json: params
    end
end