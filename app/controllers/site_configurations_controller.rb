class SiteConfigurationsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?

  def index
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
  end

  def destroy
  end

  private
  def admin_user?
    current_user.try(:admin?)
  end
end
