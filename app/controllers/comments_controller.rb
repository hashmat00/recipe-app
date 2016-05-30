class CommentsController < ApplicationController
    
    # def new
    #     @comment = Comment.new
    # end
    
    def create
        @comment = Comment.create(comment_params)
        if @comment.save
        flash[:notice] = "You have sucessfully added a comment"
        redirect_to article_path(@article)
        else 
            render 'new'
        end
    end
    
    
    def destroy
        @comment = Comment.find(params[:id])
        @comemnt.Comment.destroy
        flash[:notice] = "You have successfully deleleted the comment"
        redirect_to article_path(@article)
        
        
    end
    
    
    private
    
        def comment_params
            params.require(:comment).permit(:name, :body)
        end
    
    
   
   
    
end