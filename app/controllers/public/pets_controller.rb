class Public::PetsController < ApplicationController
def index
  #ログインしているユーザーのペットのみを表示
  @pets = current_user.pets
  @pet = Pet.new
end

def create
  @pets = current_user.pets
  @pet = Pet.new
  #ペットとユーザーIDの紐付け
  @pet.user_id = current_user.id
  if @pet.save
    redirect_to action: :index
  else
    @pets = current_user.pets
    render :index
  end
end

def edit
  @pet = Pet.find(params[:id])
end

def update
  
end

def destroy
  
end

private

def pet_params
  params.require(:pet).permit(:name, :introduction, :age, :gender, :profile_image)
end
end
