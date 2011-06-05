class PlayController < ApplicationController
  def play
    @title = "Play"
    p params.to_s

  end

  def playresults

    p "In Play Results"
    p params
    @play = Play.new
    @play.user_group_item_id = params[:user_group_item_id]
    @play.parlevel = params[:parlevel]
    @play.minReorderPoint = params[:minreorderpoint]
    @play.maxReorderPoint = params[:maxreorderpoint]
    @play.startdate = params[:startdate]
    @play.enddate = params[:enddate]

    Array @playOutputs=getTotalCostForReorderpoint()
    p @playOutputs.size()

    #@play.user_group
    # @play.save
    #algorithm
    @iTotalRecords = @playOutputs.size()
     @iTotalDisplayRecords = @playOutputs.size()
    @count =  @iTotalDisplayRecords

    respond_to do |format|
      #     format.html { redirect_to(root_url) }
      # p params[:sEcho]
      format.js
    end
  end

  private
  def getTotalCostForReorderpoint()
    p "in total costs for reorder point"
    Array _playOutputs = Array.new
    _reorderpoint = 1

    for _reorderpoint in 1..10
      #the logic should go here
      _playOutputs[_reorderpoint-1] = PlayOutput.new(@play.user_group_item,@play.parlevel,_reorderpoint,2,40,1000,10,0)

    end
    return _playOutputs
  end

end
