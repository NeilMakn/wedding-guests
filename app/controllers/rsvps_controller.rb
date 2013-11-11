class RsvpsController < ApplicationController

  # GET /rsvps
  # GET /rsvps.json
  def index
    @rsvps = Rsvp.all
  end

  # GET /rsvps/1
  # GET /rsvps/1.json
  def show
    @rsvp = Rsvp.find(params[:id])
  end

  # GET /rsvps/new
  def new
    @rsvp = Rsvp.new
  end

  # GET /rsvps/1/edit
  def edit
    @rsvp = Rsvp.find(params[:id])
  end

  # POST /rsvps
  # POST /rsvps.json
  def create
    @rsvp = Rsvp.new(rsvp_params)

    respond_to do |format|
      if @rsvp.save
        format.html { redirect_to @rsvp, notice: 'Thank you for reserving your spot!' }
        format.json { render action: 'show', status: :created, location: @rsvp }
      else
        format.html { render action: 'new' }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rsvps/1
  # PATCH/PUT /rsvps/1.json
  def update

    @rsvp = Rsvp.find(params[:id])

    if @rsvp.update(params[:rsvp].permit(:name, :lastname, :partysize))
      redirect_to @rsvp
    else
      render 'edit'
    end

  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.json
  def destroy

    @rsvp = Rsvp.find(params[:id])


    @rsvp.destroy
    respond_to do |format|
      format.html { redirect_to rsvps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rsvp
      @rsvp = Rsvp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsvp_params
      params.require(:rsvp).permit(:name, :lastname, :partysize)
    end
end
