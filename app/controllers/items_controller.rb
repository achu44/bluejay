class ItemsController < ApplicationController

before_filter :find_item, :only => [:show, :edit, :update, :destroy]
before_filter :require_user, :only => [:edit, :update, :create, :destroy]
before_filter :require_same_user, :only => [:edit, :update, :destroy]


  def itemslist
    @items = Item.find(:all, :order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb  
      format.json { render :json => @items }
    end 
  end

  # GET /items
  # GET /items.json
  def index
    @items = Item.find(:all, :order => 'created_at DESC', :limit => 50)

    @parameter = ""
    @item_type_var = ""
    @category_array = ""
    @loc_array = ""
    @category_first = ""
    @loc_first = ""

    @parameter = params[:query].to_s
    @item_type_var = params[:r].to_s
    if params.has_key?(:checkbox)
      @category_array_temp = params[:checkbox][:cat].to_s
      @loc_array_temp = params[:checkbox][:loc].to_s
      @category_array = @category_array_temp.scan(/\w\w\w\w/)
      @loc_array = @loc_array_temp.scan(/\w\w\w\w/)

    end

    # The below works!!
    # @items = Item.tagged_with("Tick")

    # You should switch to Kaminari
    # @items = Item.paginate :page => params[:page] || 1, :per_page => 18

     # @item_hash = Hash.new
      # for i in 1..params[:checkbox].length
      #   @item_hash[:i] = params[:checkbox][:cat]
      # end

    # This is testing for 
    # @test_array = ["Books", "Dorm", "Electronics", "Tickets"]
    #@items = Item.tagged_with(@test_array, :any => true)

    # Anyway, these were from the code when Texticle was still a gem.
    # if parameter.length > 0 && item_type.length > 0
    #   @items = Item.basic_search(parameter).basic_search(item_type: item_type_var)
    # else 
       # if @parameter.length > 0
       #   @items = Item.basic_search(@parameter)
       #  end
    # else
      # if @item_type_var.length > 0
      #   @items = Item.basic_search(:item_type => @item_type_var)
      # end
    # end
    # end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @items
        }
    end

    # @low_price = params[:lownum]
    # @high_price = params[:highnum]

    # From RailsCast pg_search
    # @items = Item.text_search(params[:query]).page(params[:page]).per_page(50)

    # @search = Item.search do
    #   unless params[:r].blank?
    #     with(:item_type, item_type)
    #     end

    #   unless params[:lownum].blank?
    #     if low_price !=0
    #       with(:price).greater_than(low_price)
    #     end
    #   end

    #   unless params[:highnum].blank?
    #     if high_price !=0
    #       with(:price).less_than(high_price)
    #     end
    #   end

    #   fulltext parameter
    #   order_by(:random) #This is crucial...taking it out breaks the search if no params present.
    #   #Figure out why and make the changes.
    # end

    # @items = @search.results

    
    #This was supposed to address the problem of removing #order_by(:random)
    #if params[:search].eql?" " && params[:r] == " "
      #@items = Item.find(:all, :order => 'created_at DESC', :limit => 50)
    #end

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
