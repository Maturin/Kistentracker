class OverviewController < ApplicationController
  skip_before_filter :authorize

  # GET /teammates
  # GET /teammates.json
  def index
    @pend_crates = Overview.get_pending_crates 
    @paid_crates = Overview.get_last_paid_crates 

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render :json => @crates }
    end
  end

end
