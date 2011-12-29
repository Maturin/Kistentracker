class CratepayersController < ApplicationController
  # GET /cratepayers
  # GET /cratepayers.json
  def index
    @cratepayers = Cratepayer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cratepayers }
    end
  end

  # GET /cratepayers/1
  # GET /cratepayers/1.json
  def show
    @cratepayer = Cratepayer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cratepayer }
    end
  end

  # GET /cratepayers/new
  # GET /cratepayers/new.json
  def new
    @cratepayer = Cratepayer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @cratepayer }
    end
  end

  # GET /cratepayers/1/edit
  def edit
    @cratepayer = Cratepayer.find(params[:id])
  end

  # POST /cratepayers
  # POST /cratepayers.json
  def create
    @cratepayer = Cratepayer.new(params[:cratepayer])

    respond_to do |format|
      if @cratepayer.save
        format.html { redirect_to @cratepayer, :notice => 'Cratepayer was successfully created.' }
        format.json { render :json => @cratepayer, :status => :created, :location => @cratepayer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @cratepayer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cratepayers/1
  # PUT /cratepayers/1.json
  def update
    @cratepayer = Cratepayer.find(params[:id])

    respond_to do |format|
      if @cratepayer.update_attributes(params[:cratepayer])
        format.html { redirect_to @cratepayer, :notice => 'Cratepayer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @cratepayer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cratepayers/1
  # DELETE /cratepayers/1.json
  def destroy
    @cratepayer = Cratepayer.find(params[:id])
    @cratepayer.destroy

    respond_to do |format|
      format.html { redirect_to cratepayers_url }
      format.json { head :ok }
    end
  end
end
