class Admin::DogBreedsController < ApplicationController
  def index
    @dog_breed = DogBreed.new
    @dog_breeds = DogBreed.all
  end

  def create
    @dog_breed = DogBreed.new(dog_breed_params)
    @dog_breeds = DogBreed.all
    if @dog_breed.save
      redirect_to admin_dog_breeds_path
    else
      @dog_breeds = DogBreed.all
      render :index
    end
  end

  def edit
    @dog_breed = DogBreed.find(params[:id])
  end

  def update
    @dog_breed = DogBreed.find(params[:id])
    if @dog_breed.update(dog_breed_params)
      redirect_to admin_dog_breeds_path
    else
      render :edit
    end
  end
  private

  def dog_breed_params
    params.require(:dog_breed).permit(:name)
  end
end
