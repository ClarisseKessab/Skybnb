class Owner::IslandsController < ApplicationController
  before_action :set_island, only: %i[edit update delete_photo]

  def index
    @islands = Island.where(user: current_user)
  end

  def edit
  end

  # def update
  #   if @island.update(island_params)
  #     redirect_to owner_islands_path()
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end


  def update
    # Supprimez les paramètres de photos vides
    params[:island].delete(:photos) if params[:island][:photos] == [""]

    if island_params[:photos].present?
      @island.photos.purge # Supprime les anciennes photos si de nouvelles sont fournies
      @island.photos.attach(island_params[:photos])
    end

    if @island.update(island_params.except(:photos))
      redirect_to owner_island_path(@island), notice: 'The island was successfully updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete_photo
    photo = @island.photos.find(params[:photo_id])
    photo.purge
    redirect_to edit_owner_island_path(@island), notice: "Photo deleted with success!"
  end

  private

  def island_params
    params.require(:island).permit(:name, :description, :location, :gps_longitude, :gps_latitude, :price_per_night, :capacity, photos:[])
  end

  def set_island
    @island = Island.find(params[:id])
  end
end
