class ExhibitPatronsController < ApplicationController
  def index
    if params[:commit] == "Enter age threshold"
      search(params)
    elsif params[:search_type]
      @exhibit = Exhibit.find(params[:id])
      @patrons = @exhibit.sort_alpha
    else
      @exhibit = Exhibit.find(params[:id])
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
