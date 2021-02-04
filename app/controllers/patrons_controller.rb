class PatronsController < ApplicationController
  def index
    @patrons = Patron.all
  end

  def new
  end 
end
