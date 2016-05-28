class UrlClicksController < ApplicationController
  before_action :set_url_click, only: [:show, :edit, :update, :destroy]

  # GET /url_clicks
  # GET /url_clicks.json
  def index
    @url_clicks = UrlClick.all
  end

  # GET /url_clicks/1
  # GET /url_clicks/1.json
  def show
  end

  # GET /url_clicks/new
  def new
    @url_click = UrlClick.new
  end

  # GET /url_clicks/1/edit
  def edit
  end

  # POST /url_clicks
  # POST /url_clicks.json
  def create
    @url_click = UrlClick.new(url_click_params)

    respond_to do |format|
      if @url_click.save
        format.html { redirect_to @url_click, notice: 'Url click was successfully created.' }
        format.json { render :show, status: :created, location: @url_click }
      else
        format.html { render :new }
        format.json { render json: @url_click.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /url_clicks/1
  # PATCH/PUT /url_clicks/1.json
  def update
    respond_to do |format|
      if @url_click.update(url_click_params)
        format.html { redirect_to @url_click, notice: 'Url click was successfully updated.' }
        format.json { render :show, status: :ok, location: @url_click }
      else
        format.html { render :edit }
        format.json { render json: @url_click.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_clicks/1
  # DELETE /url_clicks/1.json
  def destroy
    @url_click.destroy
    respond_to do |format|
      format.html { redirect_to url_clicks_url, notice: 'Url click was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url_click
      @url_click = UrlClick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_click_params
      params.require(:url_click).permit(:url_id, :ip, :occurred_at)
    end
end
