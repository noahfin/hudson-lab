class PostController < ApplicationController
 def new
  @property = Property.find(params[:id])
 end
 def edit
 end

 def create
 end
 def update

 end
end
