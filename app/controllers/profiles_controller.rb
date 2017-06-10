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
    @user ||=  SiteConfiguration.cms.try(:user)
    if @user
      @user.profile ? @user.profile : @user.create_profile
    else
      nil
    end
  end
end
