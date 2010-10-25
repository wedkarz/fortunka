class FortunesController < ApplicationController
  respond_to :html
  
  def index
    @fortunes = Fortune.order("created_at desc")
    respond_with @fortunes
  end
  
  def create
    @fortune = Fortune.create(params[:fortune])
    respond_with @fortune # odpowiadamy polimorficznie
  end
  
  def show  
    @product = Product.find(params[:id])  
    respond_with @product # odpowiadamy polimorficznie
  end 
  
end
