class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.order(:created_at).reverse
  end

  def show
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favorite }
    end
  end

  def new
    @favorite = Favorite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favorite }
    end
  end

  def create
    @favorite = Favorite.new(params[:favorite])

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: 'Favorite has been created.' }
        format.json { render json: @favorite, status: :created, location: @favorite }
      else
        format.html { render action: 'new', notice: 'Favorite was not created.'}
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

    def update
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      if @favorite.update_attributes(params[:favorite])
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Favorite.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to favorites_url }
      format.json { head :no_content }
    end
  end
end
