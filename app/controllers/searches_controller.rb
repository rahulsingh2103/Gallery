class SearchesController < ApplicationController
  #before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
  #  @search = Search.new(search_params[:id])
  end

  # GET /searches/new
  def new
    @search = Search.new
    @titles = Album.all.pluck(:title)
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)
    redirect_to @search
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json

  # DELETE /searches/1
  # DELETE /searches/1.json

  def search_albums

    albums = Album.all
  end


end
 
  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def search_params
      params.require(:search).permit(:user, :title, :description, :tag)
    end

