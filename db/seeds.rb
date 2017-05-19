user = User.find_or_create_by!(email: 'admin_user@mail.com') do |user|
        user.password = 'password'
        user.password_confirmation = 'password'
        user.admin = true
      end
