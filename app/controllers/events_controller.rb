require 'open-uri'
class EventsController < ApplicationController
 before_action :set_event, only: [:show, :edit, :update, :destroy]

 def download
  @event = Event.find(params[:id])
  pdf = Prawn::Document.new(page_size: "A4", margin: 50)

  # (Assuming you have logo images for the university and school)
  pdf.image Rails.root.join('app', 'assets', 'images', 'university_logo.jpg'), at: [0, 750], width: 50, height: 50
  pdf.text "JAIPUR NATIONAL UNIVERSITY", size: 16, style: :bold, :align => :center
  pdf.text "School of Engineering & Technology", size: 12, :align => :center

  pdf.bounding_box([pdf.bounds.width - 150, 700], width: 150) do
    pdf.text "#{@event.date.strftime("%-d %B, %Y")}", align: :right
  end

  # Report Title
  pdf.text "REPORT", size: 18, style: :bold, :align => :center
  pdf.text "#{@event.name}", size: 14, style: :underline, :align => :center
  pdf.move_down 15

  pdf.text "DATE: #{@event.date.strftime("%A, %-d %B %Y")}", size: 10
  # pdf.text "TIME: 11:00 am", size: 10
  pdf.text "COORDINATOR: #{@event.coordinator_name}", size: 10
  pdf.text "PLACE: #{@event.place}", size: 10
  pdf.text "WINNER NAME: #{@event.winner_name}", size: 10 if @event.winner_name.present?
  pdf.move_down 10

  pdf.text "Description: #{@event.description}", size: 10 if @event.description.present?
  pdf.move_down 20

  if pdf.cursor > pdf.bounds.height
    pdf.start_new_page
 end

  # Images with side-by-side placement
@event.event_photos.each_slice(2) do |photos|
  photos.each_with_index do |photo, index|
     # Calculate the x_position based on the index and the width of the page
     x_position = index == 0 ? 0 : pdf.bounds.width / 2
     # Calculate the y_position based on the current cursor position
     y_position = pdf.cursor
     # Define the width of each image
     image_width = pdf.bounds.width / 2 - 50 # Subtract 10 for spacing
     # Calculate the height of the image based on its aspect ratio
     original_width, original_height = FastImage.size(StringIO.open(photo.download))
     image_height = (original_height * image_width) / original_width

     # Place the image at the calculated position
     pdf.image StringIO.open(photo.download), at: [x_position, y_position], width: image_width, height: image_height
  end
  # Move down for the next row of images
  pdf.move_down 280 # Adjust for desired spacing
  if pdf.cursor > pdf.bounds.height
    pdf.start_new_page
 end
 end
 if pdf.cursor > pdf.bounds.height
  pdf.start_new_page
end
   # Footer (Assuming you have logo images for Registrar and Coordinator)
   pdf.bounding_box([0, 20], width: pdf.bounds.width, height: 50) do
    # pdf.image "path/to/registrar_logo.png", at: [50, 0], width: 50, height: 50
    pdf.draw_text "Registrar", at: [110, 15], size: 12

    # pdf.image "path/to/coordinator_logo.png", at: [pdf.bounds.width - 100, 0], width: 50, height: 50
    pdf.draw_text "Coordinator", at: [pdf.bounds.width - 190, 15], size: 12
  end

  # Gradient and JNU Text
  pdf.fill_gradient [0, pdf.cursor], [pdf.bounds.width, pdf.cursor], "000000", "FFFFFF"
  pdf.text_box "JNU", at: [pdf.bounds.width / 2, pdf.cursor + 25], size: 20, align: :center

  send_data pdf.render,
            type: "application/pdf",
            filename: "#{@event.name} details.pdf"
 end

 # GET /events
 def index
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
      redirect_to '/', notice: 'Event was successfully created.'
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
      params.require(:event).permit(:name, :date, :place, :description, :coordinator_name, :department, :winner_name, :approved, :user_id, event_photos: [])
    end

  end
