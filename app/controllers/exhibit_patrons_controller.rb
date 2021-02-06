class ExhibitPatronsController < ApplicationController
  def index
    @exhibit = Exhibit.find(params[:id])
  end

  def create
      exhibit = Exhibit.find(params[:id])
      patron = exhibit.patrons.create!({
        name:params[:name],
        paid:params[:paid],
        age:params[:age]
        })
        patron.save
        redirect_to "/exhibits/#{exhibit.id}/patrons"
  end

  def new
    @exhibit = Exhibit.find(params[:id])
  end

  private
  def patron_params

    params.permit(:name, :paid, :age)
  end
end
