class User < ApplicationRecord
    has_many :expenses
    has_many :incomes
    has_many :target_expenses
    has_one :balance

    def create
        @new_user = User.new(user_params)

        if @new_user.save!
           return { success: true, user: @new_user }
        else
            return 'save failed'
        end
    end

    def edit
        @user = User.find(params[:id])

        if @user.update_attributes(params)
            return { success: true, user: @user }
        else
            return 'user update failed'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :location)
    end


end
