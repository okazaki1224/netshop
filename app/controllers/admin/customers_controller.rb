class Admin::CustomersController < ApplicationController
  def index
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
  end
end
