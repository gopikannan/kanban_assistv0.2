class PlayController < ApplicationController
    def play
        @title = "Play"
        p params.to_s

    end

    def playresults

        p "am here"
        p params
        @play = Play.new
        @play.user_group_item_id = params[:user_group_item_id]
        @play.parlevel = params[:parlevel]
       # @play.save
        p @current_user
        respond_to do |format|
     #     format.html { redirect_to(root_url) }
          format.js   { render :nothing => true }
        end
    end
end
