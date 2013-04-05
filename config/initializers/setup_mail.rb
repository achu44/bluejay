ActionMailer::Base.smtp_settings = {
    :address            => "smtp.gmail.com",
    :port               => 587,
    :domain             => "naplist.com",
    :user_name          => "neptune44@naplist.com",
    :password           => "maplestore",
    :authentication     => :plain,
    :enable_starttls_auto => true
 }

ActionMailer::Base.default_url_options[:host] = "naplist.com"