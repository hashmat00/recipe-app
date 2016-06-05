class WelcomeController < ApplicationController
    
    def home
        @chefs = Chef.paginate(page: params[:page], per_page: 4)
        @recipes = Recipe.paginate(page: params[:page], per_page: 3)
        redirect_to recipes_path if logged_in?
        
    end
    
    def about
        
    end
    
    
end
