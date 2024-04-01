require 'open-uri'
class EventsController < ApplicationController
 before_action :set_event, only: [:show, :edit, :update, :destroy]

 def download
  @event = Event.find(params[:id]) # Assuming you're finding the event by its ID
  pdf = Prawn::Document.new

  # Add form title and basic information
  pdf.text "#{@event.name}", size: 20, style: :bold

  pdf.text "Date: #{@event.date}"
  pdf.text "Place: #{@event.place}"
  pdf.text "Coordinator: #{@event.coordinator_name}"
  pdf.text "Winner name: #{@event.winner_name}" if @event.winner_name.present?

  # Add images side by side
  @event.event_photos.each_with_index do |photo, index|
    # Calculate the x position based on the index
    x_position = index.even? ? 0 : pdf.bounds.width / 2
    pdf.bounding_box([x_position, pdf.cursor], width: pdf.bounds.width / 2) do
      image_data = StringIO.open(photo.download)
      pdf.image image_data, width: pdf.bounds.width, height: 150
    end
    pdf.move_down 20 if index.even? # Add space after every second image
  end

  # Add information about creator and approval
  pdf.text "Created by: #{@event.user.name}"

  pdf.fill_gradient [0, pdf.cursor], [pdf.bounds.width, pdf.cursor], "000000", "FFFFFF"
  pdf.text_box "JNU", at: [pdf.bounds.width / 2, pdf.cursor + 25], size: 20, align: :center

  send_data pdf.render, type: "application/pdf", filename: "#{@event.name} details.pdf"
 end

 # GET /events
 def index
    @events = Event.all
 end

 # GET /events/1
 def show
 end

 # GET /events/new
 def new
    @event = Event.new
 end

 # GET /events/1/edit
 def edit
 end

 # POST /events
 def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

 # PATCH/PUT /events/1
 def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

 # DELETE /events/1
 def destroy
    @event.destroy
    redirect_to root_path , notice: 'Event was successfully destroyed.'
 end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :date, :place, :coordinator_name, :department, :winner_name, :approved, :user_id, event_photos: [])
    end

  end
