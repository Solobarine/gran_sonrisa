class CarsController < ApplicationController
  before_action :authenticate_user!
  def index
    @manufacturers = Manufacturer.top_manufacturers
    @cars = Car.all
  end

  def show
    @car = Car.includes(:manufacturer).find(params[:id])
  end

  def new
    @manufacturers = Manufacturer.all
    @car = Car.new
  end

  def categories; end

  def category; end

  def create
    # if images_empty?
    #   return redirect_to new_car_path
    # end
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car = @manufacturer.cars.create(car_params)
    if @car.save
      redirect_to cars_path, notice: 'Car successfully created'
    else
      puts 'errors'
      puts 'Unable to Attach Files'
      redirect_to new_car_path, notice: 'Something went wrong'
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.update_attributes(params[:car])
      flash[:success] = 'Car was successfully updated'
      redirect_to @car
    else
      flash[:error] = 'Car Update Failed'
      render 'edit'
    end
  end

  def destroy
    return unless current_user.admin

    @car = Car.find(params[:id])
    if @car.destroy
      flash[:success] = 'Car was successfully deleted.'
      redirect_to cars_path
    else
      flash[:error] = 'Something went wrong'
    end
  end

  private

  def car_params
    params.require(:car).permit(:model,
                                :body_style,
                                :mileage,
                                :color,
                                :transmission,
                                :engine,
                                :fuel_type,
                                :drive_train,
                                :year,
                                :price,
                                :description,
                                images: [])
  end

  def images_empty?
    params[:images].empty?
  end
end
