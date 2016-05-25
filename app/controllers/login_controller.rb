class LoginController < ApplicationController
    
    
   def new
       
   end
   
   
   def create
       chef = Chef.find_by(email: params[:email])
       if chef && chef.authenticate(params[:password])
       session[:chef_id] = chef.id
       flash[:success] = "You have successfully logged in"
       redirect_to root_path
     else
         flash.now[:danger] = "Your email or password do not matched"
         render 'new'
     end
     
    end
 
 
 
    def destroy
        session[:chef_id] = nil
        flash[:success] = "You have successfully logout"
        redirect_to login_path
        
    end
    
    
end