user = User.find_or_create_by!(email: 'admin_user@mail.com') do |user|
        user.password = 'password'
        user.password_confirmation = 'password'
        user.admin = true
      end

site_config = SiteConfiguration.find_or_create_by(key: 'cms') do |site_config|
                site_config.settings = {title: 'Carlos Gabaldon', tagline: '(Hack Learn Grow)'}.to_json
                site_config.user = user
              end


bio = <<-BIO
<p>
Senior leader, developer, and agile coach with experience building high quality products that provide value.
</p>

<h2>Experience</h2>

<ul>
  <li>17 years of hands on software development experience</li>
  <li>12 years of software development management experience</li>
</ul>

<h2>Domains</h2>
<ul>
  <li>Lead Generation</li>
  <li>Mobility</li>
  <li>Daily Deals</li>
  <li>Hosting</li>
  <li>Online Education</li>
  <li>Supply Chain</li>
  <li>Retail Systems</li>
  <li>Travel Systems</li>
  <li>OCR Systems</li>
</ul>

<h2>Languages</h2>
<ul>
  <li>Ruby</li>
  <li>Python</li>
  <li>Java</li>
</ul>

BIO


unless user.profile
  user.create_profile(first_name: 'Carlos',
                      last_name: 'Gabaldon',
                      bio: bio)
end
