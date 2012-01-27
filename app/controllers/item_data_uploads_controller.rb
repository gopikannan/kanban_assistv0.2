# ecoding: utf-8
require 'spreadsheet'
class ItemDataUploadsController < ApplicationController
  def create
    @itemDataUpload = ItemDataUpload.new

    p " IN ITE DATA UPLOADS"
    p params[:datasetName]
    uploaded_io_item = params[:item_data_upload][:item]
    File.open(Rails.root.join('public', 'uploads', uploaded_io_item.original_filename), 'wb') do |file|
      file.write(uploaded_io_item.read)
    end

    uploaded_io_demand = params[:item_data_upload][:demand]
    File.open(Rails.root.join('public', 'uploads', uploaded_io_demand.original_filename), 'wb') do |file|
      file.write(uploaded_io_demand.read)
    end

    @items_hash = Hash.new()
    book = Spreadsheet.open(Rails.root.join('public', 'uploads', uploaded_io_item.original_filename))


    book.worksheets.each do |sheet|
      sheet.each 1 do |row|
        if !(@items_hash.has_key?(row[0].to_i))
          i =Item.new
          i.identifier = row[0].to_i
          i.name = row[1]
          i.box_quantity = row[2]
          i.orederingcost = row[3]
          i.stockoutpenaltycost = row[4]
          i.holdingcost = row[5]
          @items_hash[i.identifier] = i
        end
      end
    end

    p "Hashed Length"
    p @items_hash.length

    @item_demand_hash = Hash.new()

    book = Spreadsheet.open(Rails.root.join('public', 'uploads', uploaded_io_demand.original_filename))

    book.worksheets.each do |sheet|
      sheet.each 1 do |row|
        row[0] = row[0].strip.to_i
        row[1] = row[1]
        row[2] = row[2]

        if (@item_demand_hash.has_key?(row[0]))
          if (@item_demand_hash[row[0]].has_key?(row[2]))
            @item_demand_hash[row[0]][row[2]].demandcount += row[1]
          else
            @item_demand_hash[row[0]][row[2]] = Hash.new()
            d = Demand.new
            d.demandcount = row[1].to_i
            d.startdate = row[2]
            @item_demand_hash[row[0]][row[2]] = d
          end
        else
          @item_demand_hash[row[0]] = Hash.new()
        end

      end

    end


    @items_hash.keys.each do |item_id|
      if @item_demand_hash.has_key?(item_id)

        @item_demand_hash[item_id].keys.each do |uds|
          @items_hash[item_id].demands << @item_demand_hash[item_id][uds]
          #p @item_demand_hash[item_id][uds].demandcount
          #p @item_demand_hash[item_id][uds].startdate
        end

      end
    end
    dataset = Dataset.new()
    dataset.name  = params[:datasetName]
    @items_hash.keys.each do |item_id|
      dataset.items << @items_hash[item_id]
    end
    p dataset.items.length
    # need to handle errors
    dataset.save()
    #i = Item.new
    #p row[0]
    #p row[1]
    # p row[2]


    redirect_to (:back)
  end
end
