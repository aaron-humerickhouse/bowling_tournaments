# frozen_string_literal: true

class UserSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_setting, only: %i[show edit update]

  # GET /user_settings/1 or /user_settings/1.json
  def show; end

  # GET /user_settings/1/edit
  def edit; end

  # POST /user_settings or /user_settings.json
  def create
    @user_setting = UserSetting.new(user_setting_params)

    respond_to do |format|
      if @user_setting.save
        format.html { redirect_to settings_path(@user_setting), notice: 'User setting was successfully created.' }
        format.json { render :show, status: :created, location: @user_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_settings/1 or /user_settings/1.json
  def update
    respond_to do |format|
      if @user_setting.update(user_setting_params)
        format.html { redirect_to settings_path(@user_setting), notice: 'User setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_setting
    @user_setting = current_user.user_setting
    # UserSetting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_setting_params
    params.require(:user_setting).permit(:notification_search_radius, :zip_code, notification_period: [])
  end
end
