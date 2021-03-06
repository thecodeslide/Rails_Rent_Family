class BookingsController < ApplicationController
  before_action :set_booking, only: :update

  def index
    @bookings = policy_scope(current_user.bookings)
    @booking = Booking.new
    @categories = Category.where(user: @current_user)
  end

  def new
    @booking = authorize Booking.new
    @category = set_category
  end

  def show
    set_booking
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    @category = set_category
    @booking.user = current_user
    @booking.category = @category
    if @booking.save
      redirect_to my_page_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to my_page_path
    else
      render 'users/my_page'
    end
  end

  private
  # strong params!
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_category
    Category.find(params[:category_id])
  end
end
