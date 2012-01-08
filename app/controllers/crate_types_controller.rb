class CrateTypesController < ApplicationController
  before_filter :need_admin_priveledge

  # GET /crate_types
  # GET /crate_types.json
  def index
    @crate_types = CrateType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @crate_types }
    end
  end

  # GET /crate_types/1
  # GET /crate_types/1.json
  def show
    @crate_type = CrateType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @crate_type }
    end
  end

  # GET /crate_types/new
  # GET /crate_types/new.json
  def new
    @crate_type = CrateType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @crate_type }
    end
  end

  # GET /crate_types/1/edit
  def edit
    @crate_type = CrateType.find(params[:id])
  end

  # POST /crate_types
  # POST /crate_types.json
  def create
    @crate_type = CrateType.new(params[:crate_type])

    respond_to do |format|
      if @crate_type.save
        format.html { redirect_to @crate_type, :notice => 'Crate type was successfully created.' }
        format.json { render :json => @crate_type, :status => :created, :location => @crate_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @crate_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crate_types/1
  # PUT /crate_types/1.json
  def update
    @crate_type = CrateType.find(params[:id])

    respond_to do |format|
      if @crate_type.update_attributes(params[:crate_type])
        format.html { redirect_to @crate_type, :notice => 'Crate type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @crate_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crate_types/1
  # DELETE /crate_types/1.json
  def destroy
    @crate_type = CrateType.find(params[:id])
    @crate_type.destroy

    respond_to do |format|
      format.html { redirect_to crate_types_url }
      format.json { head :ok }
    end
  end
end
