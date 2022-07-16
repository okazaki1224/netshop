class Public::AddressesController < ApplicationController
  def index
    @address=Address.new
    @addresses=Address.all
  end

  def edit
  end

  def create
    @addresses=Address.all
    @address=Address.new(address_params)
    @address.save
    redirect_to "/addresses"
  end

  def update
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code, :customer_id)
  end
end
