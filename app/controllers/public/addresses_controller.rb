class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @address=Address.new
    @addresses=current_customer.addresses.all
  end

  def edit
    @address=Address.find(params[:id])
  end

  def create
    address=Address.new(address_params)
    address.customer_id=current_customer.id
    address.save
    redirect_to "/addresses"
  end

  def update
    @address=Address.find(params[:id])
    @address.customer_id=current_customer.id
    @address.update(address_params)
    redirect_to "/addresses"
  end

  def destroy
    address=Address.find(params[:id])
    address.customer_id=current_customer.id
    address.destroy
    redirect_to "/addresses"
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end
