class PatronsController < ApplicationController
  def index
    @patrons = Patron.all_paid
  end

  def new

  end

  def create
    exhibit = Exhibit.find(16)
    patron = exhibit.patrons.create(patron_params)

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
    patron.update(patron_params)
      patron.save
      redirect_to "/patrons/#{patron.id}"
  end

  def destroy
    Patron.destroy(params[:id])
    redirect_to '/patrons'
  end


  private
  def patron_params
    params.require(:patron).permit(:name, :open, :cost)
  end

end
