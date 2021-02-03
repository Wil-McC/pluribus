class ExhibitsController < ApplicationController
  def index
    @exhibits = Exhibit.all
  end

  def new
  end

  def create
    exhibit = Exhibit.new({

      name:params[:exhibit][:name],
      open:params[:exhibit][:open],
      cost:params[:exhibit][:cost]
                          })
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
    exhibit.update({ 
      name:params[:exhibit][:name],
      open:params[:exhibit][:open],
      cost:params[:exhibit][:cost]
      })
    exhibit.save
    redirect_to "/exhibits/#{exhibit.id}"
  end

  private
  def exhibit_params
    params.permit(:name, :open, :cost)
  end
end
