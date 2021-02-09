class PatronsController < ApplicationController
  def index
    @patrons = Patron.all_paid 
  end

  def new

  end

  def create
    patron = Patron.new ({
      name:params[:patron][:name],
      paid:params[:patron][:paid],
      age:params[:patron][:age]
      })

      patron.save!
      redirect_to '/patrons'
  end

  def show
    @patron = Patron.find(params[:id])
  end

  def edit
    @patron = Patron.find(params[:id])
  end

  def update
    patron = Patron.find(params[:id])
    patron.update({
      name: params[:patron][:name],
      paid: params[:patron][:paid],
      age: params[:patron][:age]
      })
      patron.save
      redirect_to "/patrons/#{patron.id}"
  end

  def destroy
    Patron.destroy(params[:id])
    redirect_to '/patrons'
  end

  end 
end
