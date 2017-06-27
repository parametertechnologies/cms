class SiteConfigurationsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?
  before_action :set_site_configuration, only: [:show, :edit, :update ]

  def index
    @site_configurations = SiteConfiguration.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    if @site_configuration.update(site_configuration_params)
      redirect_to @site_configuration
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def admin_user?
    current_user.try(:admin?)
  end

  def site_configuration_params
    settings_params = params.require(:site_configuration).permit(settings: {})
    settings_params = settings_params.merge(settings: settings_params[:settings].to_json)
  end

  def set_site_configuration
    @site_configuration = SiteConfiguration.find(params[:id])
  end
end
