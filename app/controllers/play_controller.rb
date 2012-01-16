class PlayController < ApplicationController
  def play
    @title = "Play"
    p params.to_s

  end

  def playresults


    @play = Play.new
    @play.user_group_item_id = params[:user_group_item_id]
    @play.parlevel = params[:parlevel]
    @play.minReorderPoint = params[:minReorderPoint]
    @play.maxReorderPoint = params[:maxReorderPoint]
    @play.startdate = Date.strptime(params[:startdate],'%m/%d/%Y')
    @play.enddate = Date.strptime(params[:enddate],'%m/%d/%Y')

    p @play.startdate
    p @play.enddate

    #_demands = [4,4,1,2,4]

   # _demands = Array.new
    #_demands[0] = UserGroupDemand.new(:demandcount=>0,:leadtime=>0)
    #_demands[1] = UserGroupDemand.new(:demandcount=>4,:leadtime=>2)
    #_demands[2] = UserGroupDemand.new(:demandcount=>4,:leadtime=>3)
    #_demands[3] = UserGroupDemand.new(:demandcount=>1,:leadtime=>2)
    #_demands[4] = UserGroupDemand.new(:demandcount=>2,:leadtime=>3)
    #_demands[5] = UserGroupDemand.new(:demandcount=>4,:leadtime=>2)

    @play.demands = UserGroupDemand.where(:startdate=>@play.startdate...@play.enddate,:user_group_item_id=>@play.user_group_item)
    Array @playOutputs=getTotalCostForReorderpoint()



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

  #tentative algo
  #find the timeperiod for the input date range and the demand
  #timeperiod should be tuple of index and day_id(monday,tue, etc))
  #Get the ideal lead time cycle for the item
  #initialize datastructures
      #Actual Lead Time (is n't this part of the demand????'))
      #IdealLeadTime (This is going to be a cycle.. 7 records)
      #demand[] demand of the item in the given time range
      #onHandInventory[]
      #quantityOrdered[]
      #stockOuts[]
      #overPars[]

      #boxQuantity
  #once this is done... run the logic..

   #costs
      #holdingCost;
	    #orderingCostOfTheItem;
	    #overParPenalityCost;
	    #penalityCost;
      #totalCost

  def getTotalCostForReorderpoint()

    Array _playOutputs = Array.new
    _counter = 0




    #delta = @play.startdate - @play.enddate
   # p delta.days


    for _reorderpoint in (@play.minReorderPoint...@play.maxReorderPoint+1)
      #the logic should go here
      _playOutputs[_counter] = @play.findCostsForReorderPoint(_reorderpoint)
      _counter=_counter+1

    end
    return _playOutputs
  end



end
