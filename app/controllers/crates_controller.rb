class CratesController < ApplicationController
  # GET /crates
  # GET /crates.json
  def index
    @crates = Crate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @crates }
    end
  end

  # GET /crates/1
  # GET /crates/1.json
  def show
    @crate = Crate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @crate }
    end
  end

  # GET /crates/new
  # GET /crates/new.json
  def new
    @crate = Crate.new
    @payers = get_cratepayers()
    @types = get_crate_types()
    @priorities = get_crate_priorities()

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @crate }
    end
  end

  # GET /crates/1/edit
  def edit
    @crate = Crate.find(params[:id])
    @payers = get_cratepayers()
    @types = get_crate_types()
    @priorities = get_crate_priorities()
  end

  # POST /crates
  # POST /crates.json
  def create
    @crate = Crate.new(params[:crate])

    respond_to do |format|
      if @crate.save
        format.html { redirect_to @crate, :notice => 'Crate was successfully created.' }
        format.json { render :json => @crate, :status => :created, :location => @crate }
      else
        format.html { render :action => "new" }
        format.json { render :json => @crate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crates/1
  # PUT /crates/1.json
  def update
    @crate = Crate.find(params[:id])

    respond_to do |format|
      if @crate.update_attributes(params[:crate])
        format.html { redirect_to @crate, :notice => 'Crate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @crate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crates/1
  # DELETE /crates/1.json
  def destroy
    @crate = Crate.find(params[:id])
    @crate.destroy

    respond_to do |format|
      format.html { redirect_to crates_url }
      format.json { head :ok }
    end
  end

  def show_waspaid
    @crate = Crate.find(params[:id])
  end

  private

  def get_cratepayers
    payers = Cratepayer.order(:name).map { |payer| [payer.name, payer.id] } 
    return payers
  end

  def get_crate_priorities
    priorities = CratePriority.order(:priority).map { |priority| [priority.description, priority.priority] } 
    return priorities
  end

  def get_crate_types
    types = CrateType.order(:description).map { |type| [type.description, type.description] }
    return types
  end
end
