class PlayOutput
  # To change this template use File | Settings | File Templates.
  attr_accessor :item_id
  attr_accessor :parlevel
  attr_accessor :reorderpoint
  attr_accessor :stockouts
  attr_accessor :holdingcost
  attr_accessor :stockout_penaltycost
  attr_accessor :orderingcost
  attr_accessor :overdrafts

  def initialize(item_id, parlevel, reorderpoint, stockouts, holdingcost, stockout_penaltycost, orderingcost, overdrafts)
    @item_id = item_id
    @reorderpoint = reorderpoint
    @stockouts = stockouts
    @holdingcost = holdingcost
    @parlevel = parlevel
    @stockout_penaltycost = stockout_penaltycost
    @orderingcost = orderingcost
    @overdrafts = overdrafts
  end
end                                                     