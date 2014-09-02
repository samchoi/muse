class AudiosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_audio, only: [:show, :edit, :update, :destroy]

  # GET /audios
  # GET /audios.json
  def index
    if params[:likes]
      @audios = Like.where(user_id: params[:likes].to_i).group(:audio_id).map{ |l| l.audio }
    elsif params[:history]
      @audios = PlayHistory.where(user_id: params[:history].to_i).group(:audio_id).order('audio_id DESC').map{ |ph| ph.audio }
    else
      @audios = Audio.where.not(id: PlayHistory.where(user_id: 1).group(:audio_id).map{ |ph| ph.audio_id })
    end
  end

  # GET /audios/1
  # GET /audios/1.json
  def show
  end

  # GET /audios/new
  def new
    @audio = Audio.new
  end

  # GET /audios/1/edit
  def edit
  end

  # POST /audios
  # POST /audios.json
  def create
    @audio = Audio.find_by_code(params[:audio][:code]) if params[:audio][:code]
    if(@audio.nil?)
      @audio = Audio.new(audio_params)
    else
      @audio.update(audio_params)
    end


    respond_to do |format|
      if @audio.save
        format.html { redirect_to @audio, notice: 'Audio was successfully created.' }
        format.json { render :show, status: :created, location: @audio }
      else
        format.html { render :new }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audios/1
  # PATCH/PUT /audios/1.json
  def update
    respond_to do |format|
      if @audio.update(audio_params)
        format.html { redirect_to @audio, notice: 'Audio was successfully updated.' }
        format.json { render :show, status: :ok, location: @audio }
      else
        format.html { render :edit }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audios/1
  # DELETE /audios/1.json
  def destroy
    @audio.destroy
    respond_to do |format|
      format.html { redirect_to audios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio
      @audio = Audio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_params
      params.require(:audio).permit(:code, :title, :artist, :posturl, :thumb_url)
    end
end
