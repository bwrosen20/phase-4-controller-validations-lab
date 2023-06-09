class AuthorsController < ApplicationController
  
  
  def show
    author = Author.find(params[:id])
    render json: author
  rescue ActiveRecord::RecordNotFound
    render json: {error:author.errors.full_messages}, status: :not_found
  end

  def create
    author = Author.create!(author_params)
      render json: author, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
      render json: {errors:invalid.record}, status: :unprocessable_entity
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  
end
