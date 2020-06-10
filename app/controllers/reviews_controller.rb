class ReviewsController < ApplicationController
  def new
    # raise
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:id])
    # 2.create the review with the strong params
    @review = Review.new(reviews_strong_params)
    # 3. we want to assign the review to the restaureant of the url
    @review.restaurant_id = @restaurant.id
    @review.save!
    redirect_to restaurant_path(@restaurant)
  end


  private
  def reviews_strong_params
    params.require(:review).permit(:content, :rating)
  end

end
