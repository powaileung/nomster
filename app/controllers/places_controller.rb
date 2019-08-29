class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # created a only logged in users can access this edit, update page. 8/28/2019

  def index
    @places = Place.paginate(page: params[:page], per_page: 10)
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end  
  end
  # created a if statement to make sure right information validation. 8/28/2019

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
    if @place.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end  
  end
  # created a update function on individual place page. 8/27/2019
  # created a update user permissions function on individual place page. 8/28/2019
  # created a if statement to make sure right information validation. 8/28/2019

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @place.destroy
    redirect_to root_path
  end
  # created a delete function on individual place page. 8/27/2019
  # created a delete user permissions function on individual place page. 8/28/2019
  
  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end



