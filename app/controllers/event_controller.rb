class EventController < ApplicationController
  class EventsController < ApplicationController
    before_action :set_event, only: %i[ show edit update destroy ]
  
    # GET /events or /events.json
    def index
      @events = Event.all
    end
  
    # GET /events/1 or /events/1.json
    def show
    end
  
    # GET /events/new
    def new
      @event = Event.new
    end
  
    # GET /events/1/edit
    def edit
    end
  
    # POST /events or /events.json
    def create
      @event = Event.new(event_params)
    end
  
    # PATCH/PUT /events/1 or /events/1.json
    def update
    end
  
    # DELETE /events/1 or /events/1.json
    def destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = Event.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def event_params
        params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
      end
  end
end
