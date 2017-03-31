class ProductsController < ApplicationController
  
  before_action :find_service

  def index
    @products = @service.products
    require 'csv'
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls

      format.pdf do
        render :pdf => "Products", :template => "layouts/pdf.html.erb" # file_name Excluding ".pdf" extension.
      end
    end
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @products = Product.where(:service_id => params[:product][:service_id])
  end

  def edit
  	@product = Product.find(params[:id])
    @service = Service.find(@product.service_id)
  end

  def update
    @product = Product.find(params[:id])
  	@product.update_attributes(product_params)
    @products = Product.where(:service_id => params[:product][:service_id])
  end

  def delete
  	@product = Product.find(params[:product_id])
  end

  def destroy
  	@product = Product.find(params[:id]).destroy
    @products = Product.where(:service_id => @product.service_id)
  end

  private
  def product_params
  	params.require(:product).permit(:service_id, :name, :platforms)
  end

  def find_service
    if params[:service_id]
      @service = Service.find(params[:service_id])
    end
  end

end
