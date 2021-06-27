class DogsController < ApplicationController
  def create
    if current_user
      dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed],
        user_id: current_user.id
      )
      dog.save
      render json: dog
    else
      render json: {message: "You must be logged in to create new dogs."}
    end
  end
end
