class TemplatesController < ApplicationController
  def index
    @menu = Menu.friendly.find(params[:menu_id])
    @templates = @menu.templates
  end

  def show
    @menu = Menu.friendly.find(params[:menu_id])
    @template = Template.find(params[:id])
  end
end
