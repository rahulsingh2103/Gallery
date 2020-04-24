class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index ]
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index


   # @search = Album.search(params[:q])
   # @albums = @search.result
   #   if var ==true
      #    @search = Album.search(params[:q])
     #     @albums = @search.result
          # @albums = Album.search(params[:search])
        #  @albums = Album.where(["title LIKE ?", "%#{params[:search]}%"]).page(params[:page])

       #   @albums = Album.order(:title).page(params[:page])
      #else
       #   @albums = current_user.albums.page(params[:page])
      #end
    
      
     var = current_user.admin
      if var ==true
        @search_admin = Album.ransack(params[:q])
        @albums = @search_admin.result.includes(:user).page(params[:page])
      else
       # @albums = current_user.albums
        @search_current = current_user.albums.ransack(params[:q])
        @albums = @search_current.result.includes(:user).page(params[:page])
      end
     

  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  
  end
  
  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    @album.user = current_user
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
 
  # DELETE /albums/1.json
  def destroy
    
   @album.destroy
       respond_to do |format|
        format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
        format.json { head :no_content }
       end
  end

  def delete_upload
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge # or use purge_later
    redirect_back(fallback_location: albums_url)
  end

 

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:title, :discription, :tag, images: [])
    end
end
