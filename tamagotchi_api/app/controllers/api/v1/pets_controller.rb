class Api::V1::PetsController < ApplicationController


	def create
		@pet = Pet.create(pet_params)
		# byebug
		render json: @pet
	end

	def update
		byebug
	end

	def feed
		pet = Pet.find_by(id:params[:id])
		pet.hunger = pet.hunger + 2
		pet.save
		render json: pet
	end

	def show
		pet = Pet.find_by(id: params[:id])
		render json: pet
	end

	def sleep
		pet = Pet.find_by(id:params[:id])
		pet.sleepiness = pet.sleepiness + 2
		pet.save
		render json: pet
	end

	def index
		@pets = Pet.all
		render json: @pets, each_serializer: PetIndexSerializer
	end

	def rubiks
		pet = Pet.find_by(id:params[:id])
		pet.happiness = pet.happiness + 2
		pet.intelligence = pet.intelligence + 2
		pet.save
		render json: pet
	end

	def jumprope
		pet = Pet.find_by(id:params[:id])
		pet.happiness = pet.happiness + 2
		pet.sleepiness = pet.sleepiness - 2
		pet.save
		render json: pet
	end

	def fidgetspinner
		pet = Pet.find_by(id:params[:id])
		pet.happiness = pet.happiness + 2
		pet.intelligence = pet.intelligence + 2
		pet.save
		render json: pet
	end

	private

	def pet_params
		params.require(:pet).permit(:name, :intelligence, :happiness, :hunger, :sleepiness, :image, :setting_id, toy_ids:[])
	end


end
