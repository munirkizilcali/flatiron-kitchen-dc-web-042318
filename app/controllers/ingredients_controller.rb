class IngredientsController < ApplicationController

	before_action :find_ingredient, only:[:edit, :update, :show]
	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)
		if @ingredient.valid?
			@ingredient.save
			redirect_to ingredient_path(@ingredient)
		else
			render :new
		end
	end

	def edit

	end

	def update
		@ingredient.attributes = ingredient_params
		if @ingredient.valid?
			@ingredient.save
			redirect_to ingredient_path(@ingredient)
		else
			render :edit
		end
	end

	def show

	end

	private

	def find_ingredient
		@ingredient = Ingredient.find(params[:id])
	end

	def ingredient_params
		params.require(:ingredient).permit(:name)
	end

end
