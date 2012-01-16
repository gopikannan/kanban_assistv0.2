class Play < ActiveRecord::Base
  belongs_to :user_group
  belongs_to :user_group_item

  def demands
    @demands
  end

  def demands=(demands)
    @demands = demands
  end

  public

  def findCostsForReorderPoint(reorderPoint)
    #logger.warn reorderPoint
    _timePeriod = @demands.size()-1
    _onHandInventory = Array.new(_timePeriod+1)
    _stockOuts = Array.new(_timePeriod+1)
    _overPars = Array.new(_timePeriod+1)
    _quantityOrdered = Array.new(_timePeriod+1)

    _kanbanCardPicked = false
    _kanbanCardReInsertTime = -1

    _onHandInventory.fill(0)
    _stockOuts.fill(0)
    _overPars.fill(0)
    _quantityOrdered.fill(0)
    _onHandInventory[0]= self.parlevel

    for _demandTime in 1..._timePeriod+1
      #logger.warn "I am here 0"
      if (_demandTime == _kanbanCardReInsertTime)
        _kanbanCardPicked = false
        _kanbanCardReInsertTime = -1
      end
      if (_onHandInventory[_demandTime-1]>(self.parlevel*self.user_group_item.boxquantity))
        # logger.warn " I am here 1"
        _overPars[_demandTime] = (_overPars[_demandTime]+_onHandInventory[_demandTime-1]-(self.parlevel*self.user_group_item.boxquantity.to_i))
      end
      if (_onHandInventory[_demandTime] > 0)
       # logger.warn " I am here 2"
        _onHandInventory[_demandTime] = (_onHandInventory[_demandTime]+_onHandInventory[_demandTime-1]-@demands[_demandTime].demandcount)
      else
       # logger.warn " I am here 3"
        _onHandInventory[_demandTime] = (_onHandInventory[_demandTime-1]-@demands[_demandTime].demandcount)
      end

      if(_onHandInventory[_demandTime]<0)
      #  logger.warn " I am here 4"
        _stockOuts[_demandTime] = _onHandInventory[_demandTime].abs()
				_onHandInventory[_demandTime] = 0
      end

      if(_onHandInventory[_demandTime]<=reorderPoint && !_kanbanCardPicked)
     #   logger.warn " I am here 5"
        _arrivalTime  = _demandTime+@demands[_demandTime].leadtime
     #   logger.warn "I am Here"
				if(_kanbanCardReInsertTime>0)
          _kanbanCardReInsertTime = (_kanbanCardReInsertTime> _arrivalTime)? _arrivalTime : _kanbanCardReInsertTime
        else
          _kanbanCardReInsertTime = _arrivalTime
        end
        if((_arrivalTime)> _timePeriod-1)
          #do nothing
        else
          _onHandInventory[_arrivalTime] += (self.parlevel * self.user_group_item.boxquantity) - _onHandInventory[_demandTime]
        end
        _quantityOrdered[_demandTime] = (self.parlevel * self.user_group_item.boxquantity) - _onHandInventory[_demandTime]
				_kanBanCardPicked = true;

      end
    end
    _totalCost = 0
    _holdingCost = 0
    _stockOutCount = 0
    _overParCount = 0
    _orderingCost = 0
    _stockOutPenaltyCost = 0
    _overParPenaltyCost = 0

    for t in 0..._timePeriod+1
      _stockOutPenaltyCost += (self.user_group_item.stockoutpenaltycost*_stockOuts[t])
      _holdingCost += (self.user_group_item.holdingcost*_onHandInventory[t])
      _orderingCost += (self.user_group_item.orderingcost*_quantityOrdered[t])
      _overParPenaltyCost += (10*_overPars[t]) #overpar penalty should be added to item and user group item
      if(_stockOuts[t]>0)
        _stockOutCount += 1
      end
      if(_overPars[t]>0)
        _overParCount += 1
      end

    end
    _totalCost = (_stockOutPenaltyCost+_holdingCost+_orderingCost+_overParPenaltyCost)
    Rails.logger.level = 0
    #logger.warn _stockOutPenaltyCost
    #logger.warn _orderingCost
    #logger.warn _totalCost
    return PlayOutput.new(self.user_group_item,self.parlevel,reorderPoint,_totalCost,_stockOutCount,_overParCount,_stockOutPenaltyCost,_orderingCost,_holdingCost)
    #populate play output
  end
end
