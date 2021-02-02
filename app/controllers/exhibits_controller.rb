class ExhibitsController < ApplicationController
  def index
    @exhibits = ['Exhibit 1', 'Exhibit 2', 'Exhibit 3']
  end

  def new
  end
end
