class ReviewsController < ApplicationController
    before_action :find_recipe
    before_action :find_reviews, only: [:destroy, :edit, :update]
    before_action :require_user
    
   def count
    @recipe = Recipe.find(params[:Recipe_id])
    @review = @recipe.reviews.count(params[:reviews])
  end
  
  
   def create
   @review = @recipe.reviews.create(review_params)
   @review.chef = current_user
   if @review.save
       flash[:success] = "You have succesfully created review"
       redirect_to recipe_path(@recipe)
       else
           render 'new'
       end
       
   end


    def destroy
        
        @review.destroy
        flash[:danger] = "You have successfully deleted the recipe"
        redirect_to :back
    
    
    end
   
    
    def edit
       
    end
    
    
    
    def update
         if @review.update(review_params)
            redirect_to recipe_path(@recipe)
        else
            render 'edit'
        end
    end
 
    
    
    private
    
    def find_recipe
        @recipe = Recipe.find(params[:recipe_id])
    end
    
    
    def review_params
        params.require(:review).permit(:body)
    end
    
    def find_reviews
        @review = @recipe.reviews.find(params[:id])
   end
    
end