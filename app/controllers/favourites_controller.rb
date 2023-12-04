class FavouritesController < ApplicationController
  def index
    @favourites = current_user.favourites
  end

  def create
    return if Favourite.is_favourite(current_user, params[:car_id])

    @car = Car.find(params[:car_id])
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.car = @car

    if @favourite.save
      redirect_to request.referer
    else
      flash[:error] = 'Something went wrong'
      redirect_to request.referer
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    if @favourite.destroy
      redirect_to request.referer
    else
      flash[:error] = 'Something went wrong'
      redirect_to request.referer
    end
  end

  private

  def fav_params
    params.require(:favourite).permit(:user_id, :car_id)
  end
end
