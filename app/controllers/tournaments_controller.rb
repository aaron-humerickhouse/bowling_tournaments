# frozen_string_literal: true

class TournamentsController < ApplicationController
  DEFAULT_MONTHS_IN_ADVANCE = 6
  DEFAULT_MILES = 50

  before_action :set_tournament, only: %i[show edit update destroy]
  before_action :get_alleys, only: %i[new edit]

  # GET /tournaments or /tournaments.json
  def index
    set_tournament_query_params

    tournaments = fetch_tournaments_by_date_range
    @tournaments = filter_tournaments_by_distance(tournaments)
  end

  # GET /tournaments/1 or /tournaments/1.json
  def show; end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit; end

  # POST /tournaments or /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1 or /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1 or /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def get_alleys
    @alleys = Alley.order(:name)
  end

  def index_params
    params.permit(:miles, :zip_code, :months)
  end

  # Only allow a list of trusted parameters through.
  def tournament_params
    params.require(:tournament).permit(:name, :alley_id, :starts_at, :flyer_url,
                                       :contact_name, :contact_email, :contact_phone, format: [], participants: [])
  end

  # TODO: Move to tournament service
  def filter_tournaments_by_distance(tournaments)
    zip_code = index_params[:zip_code]
    return tournaments unless zip_code.present?

    miles = index_params[:miles]&.to_i || DEFAULT_MILES

    tournaments.find_all { |tournament|
      alley_address = tournament.alley.address
      distance = Geocoder::Calculations.distance_between(
        alley_address.geolocation, Geocoder.coordinates(zip_code)
      )
      distance <= miles
    }
  end

  def fetch_tournaments_by_date_range
    months = index_params[:months]&.to_i || DEFAULT_MONTHS_IN_ADVANCE
    range = [DateTime.current..months.months.from_now]

    Tournament.where(starts_at: range)
  end

  def set_tournament_query_params
    return unless current_user

    return if request.query_parameters.any?


    redirect_to(
      controller: :tournaments,
      action: :index,
      tournaments: @tournaments || [],
      zip_code: current_user.user_setting.zip_code,
      miles: current_user.user_setting.notification_search_radius,
      months: current_user.user_setting.notification_period.sort.last.days.in_months.ceil
    )
  end
end
