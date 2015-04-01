class EventsController < ApplicationController
	before_action :authenticate_user!
	
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
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			redirect_to @event
		else
			render :new
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			redirect_to @event
		else
			render :edit
		end
	end

private
    def event_params
    	params.require(:event).permit(:name, :address, :longitude, :latitude, :description, :date, :time)
    end
      
  

end


