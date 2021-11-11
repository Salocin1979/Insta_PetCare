class AnimalsController < ApplicationController
    before_action :set_animal, only: [:show, :edit, :update, :destroy]

    def index
      @animals = Animal.all
    end

    def new
        @animal = Animal.new
        @species = Specie.all
    end

    def create
        @animal = Animal.new(animal_params)
        @animal.user = current_user
        # @animal.specie = Specie.find_by(id:animal_params [:specie_id])
        if @animal.save
          redirect_to animals_path(@animal)
        else
          render :new
        end
    end

    def show
      
    end

    def edit
    end

    def update
      @animal.update(animal_params)
      redirect_to animal_path(@animal)
    end

    def destroy
      @animal.destroy
      redirect_to animals_path
    end

    private

    def set_animal
        @animal = Animal.find(params[:id])
    end

    def animal_params
        params.require(:animal).permit(:name, :age, :weight, :user_id, :specie_id, :photo)
    end

end
