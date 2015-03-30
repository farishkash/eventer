class EventsController < ApplicationController
	def index
		@events = Event.all
			@hash = Gmaps4rails.build_markers(@events) do |event, marker|
      		marker.lat event.latitude
      		marker.lng event.longitude
      		marker.title event.name
      		marker.infowindow event.description
    	end
	end

	def show
		@event = Event.find(params[:id])
			@hash = Gmaps4rails.build_markers(@event) do |event, marker|
      		marker.lat event.latitude
      		marker.lng event.longitude
      		marker.title event.name
      		marker.infowindow event.description
      	end
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to @event
		else
			render :new
		end
	end

private
    def event_params
    	params.require(:event).permit(:name, :address, :longitude, :latitude, :description, :date, :time)
    end
      
  

end



