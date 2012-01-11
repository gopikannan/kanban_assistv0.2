class PlayOutput
  # To change this template use File | Settings | File Templates.
  attr_accessor :item_id
  attr_accessor :parLevel
  attr_accessor :reorderPoint
  attr_accessor :totalCost
  attr_accessor :stockOuts
  attr_accessor :holdingCost
  attr_accessor :stockoutPenaltyCost
  attr_accessor :orderingCost
  attr_accessor :overPars

  def initialize(item_id, parlevel, reorderpoint,totalCost, stockouts, overpars, stockout_penaltycost, orderingcost,holdingcost)
    @item_id = item_id
    @reorderPoint = reorderpoint
    @stockOuts = stockouts
    @holdingCost = holdingcost
    @parLevel = parlevel
    @stockoutPenaltyCost = stockout_penaltycost
    @orderingCost = orderingcost
    @overPars = overpars
    @totalCost = totalCost
  end
end                                                     