class CraterpayersController < ApplicationController
  # GET /craterpayers
  # GET /craterpayers.json
  def index
    @craterpayers = Craterpayer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @craterpayers }
    end
  end

  # GET /craterpayers/1
  # GET /craterpayers/1.json
  def show
    @craterpayer = Craterpayer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @craterpayer }
    end
  end

  # GET /craterpayers/new
  # GET /craterpayers/new.json
  def new
    @craterpayer = Craterpayer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @craterpayer }
    end
  end

  # GET /craterpayers/1/edit
  def edit
    @craterpayer = Craterpayer.find(params[:id])
  end

  # POST /craterpayers
  # POST /craterpayers.json
  def create
    @craterpayer = Craterpayer.new(params[:craterpayer])

    respond_to do |format|
      if @craterpayer.save
        format.html { redirect_to @craterpayer, :notice => 'Craterpayer was successfully created.' }
        format.json { render :json => @craterpayer, :status => :created, :location => @craterpayer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @craterpayer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /craterpayers/1
  # PUT /craterpayers/1.json
  def update
    @craterpayer = Craterpayer.find(params[:id])

    respond_to do |format|
      if @craterpayer.update_attributes(params[:craterpayer])
        format.html { redirect_to @craterpayer, :notice => 'Craterpayer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @craterpayer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /craterpayers/1
  # DELETE /craterpayers/1.json
  def destroy
    @craterpayer = Craterpayer.find(params[:id])
    @craterpayer.destroy

    respond_to do |format|
      format.html { redirect_to craterpayers_url }
      format.json { head :ok }
    end
  end
end
