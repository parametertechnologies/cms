class SiteConfigurationsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?

  def index
    @site_configurations = SiteConfiguration.all
  end

  def show
    @site_configuration = SiteConfiguration.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @site_configuration = SiteConfiguration.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def admin_user?
    current_user.try(:admin?)
  end
end
