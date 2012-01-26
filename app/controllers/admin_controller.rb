class AdminController < ApplicationController
  def index
    @itemDataUpload = ItemDataUpload.new
  end
end
