# ecoding: utf-8
require 'spreadsheet'
class ItemDataUploadsController < ApplicationController
  def create
    @itemDataUpload = ItemDataUpload.new

    p " IN ITE DATA UPLOADS"
    p params[:datasetName]
    uploaded_io = params[:item_data_upload][:item]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    p " code uploaded"
    book = Spreadsheet.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename))
    sheet1 = book.worksheet 0
    @people = []
    sheet1.each 1 do |row|
      #p = Person.new
      p row[0]
      p row[1]
      p row[2]

    end
    redirect_to (:back)
  end
end
