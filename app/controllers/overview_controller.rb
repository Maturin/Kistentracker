class OverviewController < ApplicationController
  # GET /teammates
  # GET /teammates.json
  def index
    @craters = Overview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @craters }
    end
  end

end
