class SponsoredPostsController < ApplicationController
   def new
     @topic = Topic.find(params[:topic_id])
     @sponsored_post = SponsoredPost.new
   end

   def show
     @sponsored_post = SponsoredPost.find(params[:id])
   end

   def edit
     @sponsored_post = SponsoredPost.find(params[:id])
   end
 end
