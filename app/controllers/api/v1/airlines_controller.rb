module Api
    module V1
        class AirlinesController < ApplicationController
            
            protect_from_forgery with: :null_session # Provides an empty session during request but doesn't reset it completely.


            def create
                airline = Airline.new(airline_params)

                if airline.save
                    render json: AirlineSerializer.new(airline).serialized_json
                else
                    render json: {error: airline.error.messages}, status: 422
                end
            end

            def index
                airlines = Airline.all
                render json: AirlineSerializer.new(airlines, options).serialized_json
            end

            def show
                airline = Airline.find_by(slug: params[:slug])
                render json: AirlineSerializer.new(airline, options).serialized_json
            end

            def update
                airline = Airline.find_by(airline_params)

                if airline.update(airline_params)
                    render json: AirlineSerializer.new(airline, options).serialized_json
                else
                    render json: {error: airline.error.messages}, status: 422
                end
            end

            def destroy
                airline = Airline.find_by(airline_params)

                if airline.destroy(airline_params)
                   head :no_content
                else
                    render json: {error: airline.error.messages}, status: 422
                end
            end

            private

            def airline_params
                params.require(:airline).permit(:name, :image_url)
            end

            def options
                @option ||= { include: %i[reviews]}
            end

        end
    end
end