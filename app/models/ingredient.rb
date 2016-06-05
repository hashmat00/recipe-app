class Ingredient < ActiveRecord::Base
    
   validates :name, presence: true, length:{ minimum: 2, maximum: 25 },
                                    uniqueness: { case_sensitive: false }
    
    has_many :recipe_ingredient
    has_many :recipes, through: :recipe_ingredient
    
end