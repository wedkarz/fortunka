class FortunesController < ApplicationController
  respond_to :html, :atom, :js
  
before_filter :only => [:index, :tags] do
  @tags = Fortune.tag_counts  # for tag clouds    
end

def index
  @fortunes = Fortune.paginate :page => params[:page], :order => 'updated_at DESC'
  respond_with @fortunes
end

def tags
  @fortunes = Fortune.tagged_with(params[:name]).paginate :page => params[:page], :order => 'updated_at DESC'
  render 'index'
end

  # GET /fortunes/1
  # GET /fortunes/1.xml
  def show
  @fortune = Fortune.find(params[:id])
  respond_with @fortune
end

  # GET /fortunes/new
  # GET /fortunes/new.xml
  def new
    @fortune = Fortune.new
    respond_with(@fortune)
  end

  # GET /fortunes/1/edit
  def edit
    @fortune = Fortune.find(params[:id])
  end

  # POST /fortunes
  # POST /fortunes.xml
def create
  @fortune = Fortune.new(params[:fortune])
  if @fortune.save
    redirect_to fortunes_path, :notice => 'Fortune was successfully created.'
  else
    render 'new'
  end
end

  # PUT /fortunes/1
  # PUT /fortunes/1.xml
  def update
  @fortune = Fortune.find_by_id(params[:id])
  if @fortune.update_attributes(params[:fortune])
    redirect_to fortunes_path, :notice => 'Fortune was successfully updated.'
  else
    render 'edit'
  end
end

  # DELETE /fortunes/1
  # DELETE /fortunes/1.xml
  def destroy
    @fortune = Fortune.find(params[:id])
    @fortune.destroy
    respond_with(@fortune)
  end
end
