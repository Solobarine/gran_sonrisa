class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @cars = @manufacturer.cars
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.create(manufacturer_params)
    if @manufacturer.save
      redirect_to manufacturers_path, notice: 'Manufacturer was successfully created.'
    else
      redirect_to new_manufacturer_path, status: :unprocessable_entity
    end
  end
  

  def edit
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.destroy
      flash[:success] = 'Manufacturer was successfully deleted.'
      redirect_to manufacturers_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to manufacturer_path(@manufacturer)
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :description, :logo)
  end
end
