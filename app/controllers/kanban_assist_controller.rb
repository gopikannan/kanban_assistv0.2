class KanbanAssistController < ApplicationController
    def home
        @title = "Home"
    end

    def contact
        @title = "Contact"
    end

    def about
        @title = "About"
    end

    def help
        @title = "Help"
    end

    def welcome_user
#        @username = User.find(session[:user_id]).name
        if user_signed_in?
            flash[:message] = "Welcome " + current_user.email
        else
            flash[:message] = "Welcome, Please Sign In!"
        end
        @group_id = params[:play][:user_group_id]
        @user_group = current_user.user_groups.where(:group_id=>@group_id)
        @user_group_items = UserGroupItem.where(:user_group_id=>@user_group)
        #@user_group_items = UserGroupItem.all
        p "--------------------------------"
        p @group_id
        p "0000"
        p @user_group_id
        p "lllll"
        p @user_group_items
        p"--------------------------------"

    end

    def user_group
      p "In user_group"
    end

end
