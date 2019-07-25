class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index]
  before_action :check_user!, only: [:update, :edit, :show, :destroy]

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if params[:description]!='' && params[:rating]!=''
        if @review.update(review_params)
          format.js {render :update_review}
          format.html {redirect_to admin_review_path}
        else
          format.html {render :edit}
          format.json {render json: @review.errors, status: :unprocessable_entity}
        end
      else
        format.html {redirect_to reviews_url, notice: 'Review was successfully updated.'}
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @movie = @review.movie
    if @review.destroy
      respond_to do |format|
        format.html {redirect_to @movie, notice: 'Review was successfully destroyed.'}
        format.json {head :no_content}
      end
    end
  end


  def add_review
    if Movie.find params[:id]
      @movie = Movie.find(params[:id])
      if params[:description]!='' && params[:rating]!=''
        @review = @movie.reviews.create(review_params.merge(user: current_user, status: 'approved'))
        if Review.find(@review.id)
          respond_to do |format|
            format.js {render :add_review}
          end
        end
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def check_user!
    redirect_to root_path unless @review.user == current_user || current_user.admin?
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end
end
