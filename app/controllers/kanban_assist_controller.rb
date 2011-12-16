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
    end

end
