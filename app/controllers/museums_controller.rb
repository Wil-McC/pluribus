class MuseumsController < ApplicationController
  def index
    # museums_ordered = Museum.order('created_at DESC')
    @museums = Museum.museums_ordered
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
    if params.include?(:age)
      @artifacts = @museum.threshold(params[:age])
    elsif params.include?(:search_type)
      @artifacts = @museum.collection_alpha
    else
      @artifacts = @museum.artifacts
    end
  end

  def acquire
    @museum = Museum.find(params[:id])
  end
end
