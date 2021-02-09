class ExhibitPatronsController < ApplicationController
  def index
    @exhibit = Exhibit.find(params[:id])
    if params[:commit] == "Enter age threshold"
      search(params)
    elsif params[:search_type]
      @patrons = @exhibit.sort_alpha
    else
      @patrons = @exhibit.patrons
    end
  end

  def search(params)
    @exhibit = Exhibit.find(params[:id])
    age = params[:age].to_i
    @patrons = @exhibit.patrons.filter_age(age)
  end

  def create
      exhibit = Exhibit.find(params[:id])
      patron = exhibit.patrons.create!(patron_params)
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
