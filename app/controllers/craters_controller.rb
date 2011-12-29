class CratersController < ApplicationController
  # GET /craters
  # GET /craters.json
  def index
    @craters = Crater.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @craters }
    end
  end

  # GET /craters/1
  # GET /craters/1.json
  def show
    @crater = Crater.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @crater }
    end
  end

  # GET /craters/new
  # GET /craters/new.json
  def new
    @crater = Crater.new
    @payers = get_craterpayers()

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @crater }
    end
  end

  # GET /craters/1/edit
  def edit
    @crater = Crater.find(params[:id])
    @payers = get_craterpayers()
  end

  # POST /craters
  # POST /craters.json
  def create
    @crater = Crater.new(params[:crater])

    respond_to do |format|
      if @crater.save
        format.html { redirect_to @crater, :notice => 'Crater was successfully created.' }
        format.json { render :json => @crater, :status => :created, :location => @crater }
      else
        format.html { render :action => "new" }
        format.json { render :json => @crater.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /craters/1
  # PUT /craters/1.json
  def update
    @crater = Crater.find(params[:id])

    respond_to do |format|
      if @crater.update_attributes(params[:crater])
        format.html { redirect_to @crater, :notice => 'Crater was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @crater.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /craters/1
  # DELETE /craters/1.json
  def destroy
    @crater = Crater.find(params[:id])
    @crater.destroy

    respond_to do |format|
      format.html { redirect_to craters_url }
      format.json { head :ok }
    end
  end

  private

  def get_craterpayers
    payers = Craterpayer.all.map { |payer| [payer.name, payer.id] } 

    return payers
  end
end
