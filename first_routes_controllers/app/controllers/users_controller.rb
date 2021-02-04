class UsersController < ApplicationController 
    def index 
        users = User.all
        render json: users
        # render plain: "I'm in the index action!"
    end

    def create 
        # render json: params
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show 
        user = User.find(params[:id])
        render json: user
        # render json: params
    end

    def update
        # update looks similar to create, but instead of instantiating a new tweet to save to the database, we'll lookup the tweet we want to update in the database using the wildcard from the Url, which we find in the params object
            user = User.find(params[:id])
           
            if user.update(user_params)
     
                redirect_to users_url(user)
            else
                render json: user.errors.full_messages, status: :unprocessable_entity
            end
       end

    

    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to users_url
    end

    private 

    def user_params 
        params.require(:user).permit(:username)
    end

end