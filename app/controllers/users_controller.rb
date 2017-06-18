class UsersController < ApplicationController
   load_and_authorize_resource

    before_action :set_conditions, only: [:index]

    def index
      @users = @users.by_keyword(@conditions).order(id: :desc).page(params[:page]).per(PER_PAGE)
    end

    def create
      respond_to do |format|
        if @user.save
          format.js { flash[:notice] = "User has been created!" }
        else
          format.js
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.js { flash[:notice] = "User has been updated!" }
        else
          format.js
        end
      end
    end

    def delete; end

    def destroy
      respond_to do |format|
        if @user.destroy
          format.js { flash[:alert] = "User has been deleted!" }
        else
          format.js
        end
      end
    end

    private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :type)
      end

end
