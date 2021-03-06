class CratePrioritiesController < ApplicationController
  before_filter :need_admin_priveledge

  # GET /crate_priorities
  # GET /crate_priorities.json
  def index
    @crate_priorities = CratePriority.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @crate_priorities }
    end
  end

  # GET /crate_priorities/1
  # GET /crate_priorities/1.json
  def show
    @crate_priority = CratePriority.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @crate_priority }
    end
  end

  # GET /crate_priorities/new
  # GET /crate_priorities/new.json
  def new
    @crate_priority = CratePriority.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @crate_priority }
    end
  end

  # GET /crate_priorities/1/edit
  def edit
    @crate_priority = CratePriority.find(params[:id])
  end

  # POST /crate_priorities
  # POST /crate_priorities.json
  def create
    @crate_priority = CratePriority.new(params[:crate_priority])

    respond_to do |format|
      if @crate_priority.save
        format.html { redirect_to @crate_priority, :notice => 'Crate priority was successfully created.' }
        format.json { render :json => @crate_priority, :status => :created, :location => @crate_priority }
      else
        format.html { render :action => "new" }
        format.json { render :json => @crate_priority.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crate_priorities/1
  # PUT /crate_priorities/1.json
  def update
    @crate_priority = CratePriority.find(params[:id])

    respond_to do |format|
      if @crate_priority.update_attributes(params[:crate_priority])
        format.html { redirect_to @crate_priority, :notice => 'Crate priority was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @crate_priority.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crate_priorities/1
  # DELETE /crate_priorities/1.json
  def destroy
    @crate_priority = CratePriority.find(params[:id])
    @crate_priority.destroy

    respond_to do |format|
      format.html { redirect_to crate_priorities_url }
      format.json { head :ok }
    end
  end
end
