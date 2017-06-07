class ProfilesController < ApplicationController
  def show
    @profile = profile
  end

  def edit
    @profile = profile
  end

  def update
    if profile.update(profile_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio)
  end

  def profile
    ## To do - build CMS configuration setup page to store this info. Instead
    ## of storying in the Rails configuration
    @user ||= User.find_by(email: Rails.configuration.cms['cms_owner_email'])
    if @user
      @user.profile ? @user.profile : @user.create_profile
    else
      nil
    end
  end
end
