class RecipesController < ApplicationController
    before_action :set_recipe, only: [:edit, :update, :show, :like, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :destory, :update]
    
    
    
    
    def index
        # @recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse
        @recipes = Recipe.paginate(page: params[:page], per_page: 6)
    end
    
    
    
    
    def new
        @recipe = Recipe.new
    end
    
    def create
       @recipe = Recipe.new(recipe_params)
       @recipe.chef = current_user
       if @recipe.save
        flash[:success] = "You have successfully created the Recipe"
        redirect_to recipes_path
        else
            render 'new'
        end
      end
    
    
    def show
       #used set_recipe on bottom and top
       @review = Review.where(recipe_id: @recipe).order("created_At DESC")
    end
    
    def edit
        #used set_recipe on bottom and top
    end
    
    
    
    
    def update
    if @recipe.update(recipe_params)
      flash[:success] = "Your recipe was updated succesfully!"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
    
    
    
    
    def destroy
        #used set_recipe on bottom and top
        @recipe.destroy
        flash[:danger] = "You have successfully deleted the recipe"
        redirect_to recipes_path
    end
    
    def like
       #used set_recipe on bottom and top
       like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
        if like.valid?
            flash[:success] = "Your selection was successfull"
            redirect_to :back
        else
           flash[:danger] = "You can only like/dislike a recipe once" 
           redirect_to :back
        end
    end
    
    
    
    
    
    
    private
    
        def recipe_params
        params.require(:recipe).permit(:name, :summary, :description, :picture, style_ids: [], ingredient_ids: [])
    end
    
    
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
    
    
    def require_same_user
        if current_user != @recipe.chef && !current_user.admin?
        	flash[:danger] = "You can only edit/delete your own recipe"
    		redirect_to root_path
    	end
    end
end