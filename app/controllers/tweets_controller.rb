class TweetsController < ApplicationController

   before_action :authenticate_user!, only: [:new, :create]

    def index
      if params[:search].present?
  @tweets = Tweet.where(
    "road LIKE :search OR
     CAST(day AS TEXT) LIKE :search OR
     address LIKE :search OR
     about LIKE :search OR
     shop_detail LIKE :search OR
     speed_detail LIKE :search OR
     scenery_detail LIKE :search",
    search: "%#{params[:search]}%"
  )
else
  @tweets = Tweet.all
end
    end
  
    def new
        @tweet = Tweet.new
    end

    def create
    tweet = Tweet.new(tweet_params)

    tweet.user_id = current_user.id

    if tweet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
    end

   def show
    @tweet = Tweet.find(params[:id])
   end
  
   def edit
     @tweet = Tweet.find(params[:id])
   end

   def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
     else
      redirect_to :action => "new"
    end
   end
  
   def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
   end

   private
   def tweet_params
  params.require(:tweet).permit(
    :road,
    :day,
    :address,
    :about,
    :shop_detail,
    :speed_detail,
    :scenery_detail
  )
end
end