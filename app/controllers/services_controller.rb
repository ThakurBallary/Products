class ServicesController < ApplicationController
  
  def index
  	@services = Service.all
  end

  def show
  	@service = Service.find(params[:id])
  end

  def new
  	@service = Service.new
  end

  def create
  	@services = Service.all
  	@service = Service.create(service_params)
  end

  def edit
  	@service = Service.find(params[:id])
  end

  def update
  	@services = Service.all
    @service = Service.find(params[:id])
  	@service.update_attributes(service_params)
  end

  def delete
  	@service = Service.find(params[:service_id])
  end

  def destroy
  	@services = Service.all
  	@service = Service.find(params[:id]).destroy
  end

  private
  def service_params
  	params.require(:service).permit(:name, :products)
  end

end
