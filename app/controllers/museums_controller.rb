class MuseumsController < ApplicationController
  def index
    @museums = Museum.all
  end

  def new

  end

  def create
    museum = Museum.new({
      name: params[:museum][:name],
      open: params[:museum][:open],
      cost: params[:museum][:cost]
    })

    museum.save
    redirect_to '/museums'
  end

  def show
    @museum = Museum.find(params[:id])
  end
end
