class Ingredient < ActiveRecord::Base
	has_many :recipe_ingredients 
	has_many :recipes, through: :recipe_ingredients 

	validates :name, presence: true
	validates :name, uniqueness: true
end
