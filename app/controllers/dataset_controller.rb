class DatasetController < ApplicationController
  def upload
    @itemDataUpload = ItemDataUpload.new
    p "in upload"
    render 'dataset'
  end

  def getItems
    p "in dataset get itemd"
    p params[:dataset_id]
    @datasetItems = Dataset.find_by_id(params[:dataset_id]).items
    @iTotalRecords = @datasetItems.size()
    @iTotalDisplayRecords = @datasetItems.size()
    @count =  @iTotalDisplayRecords

    respond_to do |format|
      #     format.html { redirect_to(root_url) }
      # p params[:sEcho]
      format.js
    end
  end
end
