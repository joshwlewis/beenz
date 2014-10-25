class RatingsController < ApplicationController
  def index
    ratings = current_user.performed_ratings
    render json: ratings
  end

  def create
    rating = current_user.performed_ratings.build
    if rating.update_attributes params.permit(:ratee_id, :beenz)
      render json: rating
    else
      render json: { errors: rating.errors }, status: 422
    end
  end

  def update
    rating = current_user.performed_ratings.find(params[:id])
    if rating.update_attributes(params.permit(:beenz))
      render json: rating
    else
      render json: { errors: rating.errors }, status: 422
    end
  end
end
