module Admin
  class SettingsController < ApplicationController
    #http_basic_authenticate_with name: Setting.User_Name, password: Setting.Password
    before_action :logged_in_user
    before_action :get_setting, only: [:edit, :update]
    def index
      @settings = Setting.get_all
    end

    def edit
    end

    def update
      if @setting.value != params[:setting][:value]
        @setting.value = params[:setting][:value]
        @setting.save
        redirect_to admin_settings_path, notice: 'Setting has updated.'
      else
        redirect_to admin_settings_path
      end
    end

    def get_setting
      @setting = Setting.find_by(var: params[:id]) || Setting.new(var: params[:id])
    end
  end
end