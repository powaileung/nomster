class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  # created a only logged in users can access this edit, update page. 8/28/2019

  def index
    @places = Place.paginate(page: params[:page], per_page: 10)
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end
  # created a edit function on individual place page. 8/27/2019
  # created a edit user permissions function on individual place page. 8/28/2019

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @place.update_attributes(place_params)
    redirect_to root_path
  end
  # created a update function on individual place page. 8/27/2019
  # created a update user permissions function on individual place page. 8/28/2019

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end
  # created a delete function on individual place page. 8/27/2019
  
  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end



