class MuseumsController < ApplicationController
  def index
    @museums = ['MuseoD', 'Intercity Paris', 'Chantilly']
  end

  def new

  end

  def create
    museum = Museum.new({
      name: params[:museum][:name],
      open: params[:museum][:open],
      cost: params[:museum][:cost]
    })

    task.save
    redirect_to '/tasks'
  end
end
