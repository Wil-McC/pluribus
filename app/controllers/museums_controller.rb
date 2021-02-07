class MuseumsController < ApplicationController
  def index
    museums_ordered = Museum.order('created_at DESC')
    @museums = museums_ordered.all
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

  def edit
    @museum = Museum.find(params[:id])
  end

  def update
    museum = Museum.find(params[:id])
    museum.update({
      name: params[:museum][:name],
      open: params[:museum][:open],
      cost: params[:museum][:cost]
    })
    museum.save
    redirect_to "/museums/#{museum.id}"
  end

  def destroy
    Museum.destroy(params[:id])
    redirect_to '/museums'
  end

  def collection
    @museum = Museum.find(params[:id])
  end

  def acquire
    @museum = Museum.find(params[:id])
  end
end
