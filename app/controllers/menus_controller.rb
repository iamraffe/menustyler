class MenusController < ApplicationController
  def show
    @menu = Menu.friendly.find(params[:id])
  end
end
