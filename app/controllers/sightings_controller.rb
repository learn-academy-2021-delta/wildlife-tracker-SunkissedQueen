class SightingsController < ApplicationController
    def index
        # sightings = Sighting.where(date: params[:start_date]..params[:end_date])
        # render json: sightings
        sightings = Sighting.all
        render json: sightings
    end

    def show
        sighting = sightings.find(params[:id])
        render json: sighting
    end

    def create
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
          render json: sighting
        else
          render json: sighting.errors
        end
    end
    
    private
    def sighting_params
        params.require(:sighting).permit(:date, :latitude, :longitude, :animal_id)
    end    
end
