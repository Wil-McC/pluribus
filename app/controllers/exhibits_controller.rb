class ExhibitsController < ApplicationController
  def index
    if params[:param1] == "sort"
      @exhibits = Exhibit.sort_by_children
    else
    @exhibits = Exhibit.sort_by_date
    end 
  end

  def new
  end

  def create
    exhibit = Exhibit.new(exhibit_params)
      exhibit.save
      redirect_to '/exhibits'
  end

  def show
  @exhibit = Exhibit.find(params[:id])
  end

  def edit
    @exhibit = Exhibit.find(params[:id])
  end

  def destroy
    Exhibit.destroy(params[:id])
    redirect_to '/exhibits'
  end

  def update
    exhibit = Exhibit.find(params[:id])
    exhibit.update(exhibit_params)
    exhibit.save
    redirect_to "/exhibits/#{exhibit.id}"
  end

  private
  def exhibit_params
    params.require(:exhibit).permit(:name, :open, :cost)
  end
end
