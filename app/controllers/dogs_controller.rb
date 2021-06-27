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

  def index
    dogs = Dog.all
    render json: dogs
  end

  def show
    dog = Dog.find_by(id: params[:id])
    render json: dog
  end
  
  def update
    if current_user
      dog = Dog.find_by(id: params[:id])

      dog.name = params[:name] || dog.name
      dog.age = params[:age] || dog.age
      dog.breed = params[:breed] || dog.breed
      dog.user_id = params[current_user.id]
      
      dog.save
      render json: dog
    else
      render json: {message: "You must be logged in to update a dog."}
    end
  end
end
