class WelcomeController < ApplicationController
    
    def home
        @chefs = Chef.all
        redirect_to recipes_path if logged_in?
    end
    
    def about
        
    end
    
    
end
