class ReactsController < ApplicationController
  before_action :set_react, only: [:edit,:show, :update, :destroy]

  # GET /reacts
  # GET /reacts.json
  def index
    if params[:tag]
      @reacts = React.Tagged_with(params[:tag])
    else
    @reacts = React.all
    end
  end
  def show
    @album = Album.find_by(id: :album_id)
    @react = React.find(params[:id])
  end

  # GET /reacts/new
  def new
    @react = React.new
  end

  # GET /reacts/1/edit
  def edit

  end

  # POST /reacts
  # POST /reacts.json
  def create
    @react = React.new(react_params)
    @album = Album.find_by(id: params[:album_id])
    respond_to do |format|
      if @react.save
        format.html { redirect_to @react, notice: 'React was successfully created.' }
        format.json { render action: 'show', status: :created, location: @react }
      else
        format.html { render action: 'new' }
        format.json { render json: @react.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reacts/1
  # PATCH/PUT /reacts/1.json
  def update
    respond_to do |format|
      if @react.update(react_params)
        format.html { redirect_to @react, notice: 'React was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @react.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reacts/1
  # DELETE /reacts/1.json
  def destroy
    @react.destroy
    respond_to do |format|
      format.html { redirect_to reacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_react
      @react = React.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def react_params
      params.require(:react).permit(:name, :image, :album_id)
    end
end
