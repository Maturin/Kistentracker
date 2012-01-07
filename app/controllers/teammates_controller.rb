class TeammatesController < ApplicationController
  # GET /teammates
  # GET /teammates.json
  def index
    #@teammates = Teammate.all
    @teammates = Teammate.order('lastname')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teammates }
    end
  end

  # GET /teammates/1
  # GET /teammates/1.json
  def show
    @teammate = Teammate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @teammate }
      format.vcf do
        get_contact
        #render :nothing => true
      end
    end
  end

  # GET /teammates/new
  # GET /teammates/new.json
  def new
    @teammate = Teammate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @teammate }
    end
  end

  # GET /teammates/1/edit
  def edit
    @teammate = Teammate.find(params[:id])
  end

  # GET /teammates/1/password
  def changepassword
    if @teammate.nil?
      @teammate = Teammate.find(params[:id])
    end
  end

  # POST /teammates/1/password
  def updatepassword
    @teammate = Teammate.find(params[:id])

    form_fields = params[:teammate]

    respond_to do |format|
      if @teammate.change_password(form_fields[:password], form_fields[:password_new], form_fields[:password_confirmation])
        format.html { redirect_to @teammate, :notice => 'Password wurde erfolgreich geaendert.' }
      else
        render(:action => :changepassword)
      end
    end
  end

  # POST /teammates
  # POST /teammates.json
  def create
    @teammate = Teammate.new(params[:teammate])

    respond_to do |format|
      if @teammate.save
        format.html { redirect_to @teammate, :notice => 'Teammate was successfully created.' }
        format.json { render :json => @teammate, :status => :created, :location => @teammate }
      else
        format.html { render :action => "new" }
        format.json { render :json => @teammate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teammates/1
  # PUT /teammates/1.json
  def update
    @teammate = Teammate.find(params[:id])

    respond_to do |format|
      if @teammate.update_attributes(params[:teammate])
        format.html { redirect_to @teammate, :notice => 'Teammate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teammate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teammates/1
  # DELETE /teammates/1.json
  def destroy
    @teammate = Teammate.find(params[:id])
    @teammate.destroy

    respond_to do |format|
      format.html { redirect_to teammates_url }
      format.json { head :ok }
    end
  end

  private 

  def valid?(value)
    return (value.to_s.size() > 0)
  end

  def get_contact
    tm = @teammate

    fullFileName = "#{tm.firstname}_#{tm.lastname}.vcf"

    card = Vpim::Vcard::Maker.make2 do |maker|
      maker.nickname = tm.cratepayer.name

      maker.add_name do |name|
        name.given  = tm.firstname if valid?(tm.firstname)
        name.family = tm.lastname  if valid?(tm.lastname)
      end

      maker.add_addr do |addr|
        addr.location   = 'HOME'
        addr.street     = tm.address if valid?(tm.address)
        addr.locality   = tm.city    if valid?(tm.city)
        addr.postalcode = tm.zip     if valid?(tm.zip)
      end

      if valid?(tm.phone)
        maker.add_tel(tm.phone) { |t| t.location = 'HOME' }
      end

      if valid?(tm.cell)
        maker.add_tel(tm.cell)  { |t| t.location = 'CELL' }
      end
      
      if valid?(tm.cratepayer.email)
        maker.add_email(tm.cratepayer.email) { |e| e.location = 'HOME' }
      end
      
      maker.birthday = tm.dob if valid?(tm.dob) 
    end

    send_data(card.to_s, :filename => fullFileName)
  end

end
