class RecipesController < ApplicationController

	before_action :find_recipe, only:[:edit, :update, :show]
	def new
		@recipe = Recipe.new
	end

	def create
		# binding.pry
		@recipe = Recipe.new(recipe_params)
		if @recipe.valid?
			@recipe.save
			redirect_to recipe_path(@recipe)
		else
			render :new
		end
	end

	def edit

	end

	def update
		@recipe.attributes = recipe_params
		if @recipe.valid?
			@recipe.save
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end

	def show

	end

	private

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:name, ingredient_ids:[])
	end

end
