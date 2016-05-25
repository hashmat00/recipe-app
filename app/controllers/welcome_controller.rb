class WelcomeController < ApplicationController
    
    def home
        @chefs = Chef.all
    end
    
    def about
        
    end
    
    
end
