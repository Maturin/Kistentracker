class OverviewController < ApplicationController
  # GET /teammates
  # GET /teammates.json
  def index
    @pend_craters = Overview.get_pending_craters 
    @paid_craters = Overview.get_last_paid_craters 

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render :json => @craters }
    end
  end

end
