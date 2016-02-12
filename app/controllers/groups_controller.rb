class GroupsController < ApplicationController
  def show
    @group = Group.where(:subdomain => request.subdomain).first
  end
end
