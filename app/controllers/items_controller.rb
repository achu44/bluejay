class ItemsController < ApplicationController

before_filter :find_item, :only => [:show, :edit, :update, :destroy]
before_filter :require_user, :only => [:edit, :update, :create, :destroy]
before_filter :require_same_user, :only => [:edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.find(:all, :order => 'created_at DESC', :limit => 50)
    @parameter = params[:query]
    @item_type = params[:category]
    if @parameter
    @items = Item.search_by_name(@parameter)

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @items
        }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create

    @item = Item.new(params[:item])
    @item.user_id = current_user.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to '/main', :notice => 'Item was successfully created.' }
        format.json { render :json => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    
    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, :notice => 'Item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    
    @item.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
      format.json { head :ok }
    end
  end

  def itemslist
    @items = Item.find(:all, :order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb  
      format.json { render :json => @items }
    end 
  end

  private  

  def find_item
    #@item = Item.find(params[:id])
    @item = Item.where(:id => params[:id]).first
    unless @item
      redirect_to :root
    end
  end

  def require_user
    if !current_user
      redirect_to :root
    end
  end

  def require_same_user
    if current_user != @item.user
      redirect_to :root
    end
  end

end
