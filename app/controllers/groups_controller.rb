class GroupsController < ApplicationController
  def show
    @group = Group.find_by(:subdomain => request.subdomain)
  end
end
