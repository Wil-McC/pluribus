class ArtifactsController < ApplicationController
  def index
    @artifacts = Artifact.all
  end

  def show
    @artifact = Artifact.find(params[:id])
  end

  def edit
    @artifact = Artifact.find(params[:id])
  end

  def update
    artifact = Artifact.find(params[:id])
    artifact.update({
      name: params[:artifact][:name],
      rare: params[:artifact][:rare],
      age: params[:artifact][:age]
    })
    artifact.save
    redirect_to "/artifacts/#{artifact.id}"
  end

  def destroy
    Artifact.destroy(params[:id])
    redirect_to '/artifacts'
  end

  def create
    museum = Museum.find(params[:id])
    artifact = museum.artifacts.new({
      name: params[:artifact][:name],
      rare: params[:artifact][:rare],
      age:  params[:artifact][:age]
    })

    artifact.save
    redirect_to "/museums/#{ museum.id }/artifacts"
  end
end
