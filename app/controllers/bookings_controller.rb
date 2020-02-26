class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
  end

  def show
    set_booking
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to category_bookings_index_path(@booking)
    else
      render :new
    end
  end

  def edit
    set_booking
  end

  private
  # strong params!
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
