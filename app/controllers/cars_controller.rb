class CarsController < ApplicationController
  before_action :authenticate_user!
  def index
    @manufacturers = Manufacturer.top_manufacturers
    @cars = Car.all
  end

  def show
    @car = Car.includes(:manufacturer).find_by(id: params[:id])

    return unless @car.nil?

    redirect_to cars_path, notice: 'Car Does not Exist'
  end

  def new
    @manufacturers = Manufacturer.all
    @car = Car.new
  end

  def categories; end

  def category
    if params[:condition]
      @cars = Car.where(condition: params[:condition])
      nil
    elsif params[:body_style]
      @cars = Car.where(body_style: params[:body_style])
      nil
    elsif params[:fuel_type]
      @cars = Car.where(fuel_type: params[:fuel_type])
      nil
    else
      redirect_to categories_path, notice: 'Category empty or Not Found'
    end
  end

  def create
    @manufacturer = Manufacturer.find_by(id: params[:manufacturer_id])

    return unless @manufacturer

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
                                :condition,
                                :description,
                                images: [])
  end

  def images_empty?
    params[:images].empty?
  end
end
