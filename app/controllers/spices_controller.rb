class SpicesController < ApplicationController
#GET /spice
def index
    spices = Spice.all
    render json: spices
end

#POST /spice
def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
end

#PATCH /spice/:id
def update
    spice = find_spice
    spice.update(rating: 1)
    render json: spice
end

#DELETE /spice/:id
def destroy
 spice = find_spice
 spice.destroy
 head :no_content
end

private

def spice_params
 params.permit(:title, :image, :description, :notes, :rating)
end

def find_spice
    Spice.find(params[:id])
end

end
