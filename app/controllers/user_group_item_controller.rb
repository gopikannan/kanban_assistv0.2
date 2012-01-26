class UserGroupItemController < ApplicationController
  def getUserGroupItems
    @user_group_items = UserGroupItem.where(:user_group_id=>@user_group)
  end
  def displayitems
    p "Display Items"

  end
end
