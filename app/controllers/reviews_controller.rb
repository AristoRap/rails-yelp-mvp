class ReviewsController < ApplicationController
  before_action :find_restaurant, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(set_review)
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_review
    params.require(:review).permit(:rating, :content)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
