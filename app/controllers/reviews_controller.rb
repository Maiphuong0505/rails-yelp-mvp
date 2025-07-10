class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[create]
  # def index
  #   @reviews = @restaurant.reviews
  # end

  # def new
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
      # redirect-to brings the users back to the route -> controller -> action -> render the page
    else
      @reviews = @restaurant.reviews
      # tackle @reviews is nill issue when @review is not saved
      render "restaurants/show", status: :unprocessable_entity
      # rendering only, not go back to the route, @reviews defined in #show action is not accessible -> @reviews is nill
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
