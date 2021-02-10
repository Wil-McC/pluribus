class PatronsController < ApplicationController
  def index
    if params[:search]
      @patrons = Patron.partial_name_search(params[:search])
    else
      @patrons = Patron.all_paid
    end
  end

  def new

  end

  def create
    exhibit = Exhibit.find(15)
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
    params.require(:patron).permit(:name, :paid, :age)
  end

end
