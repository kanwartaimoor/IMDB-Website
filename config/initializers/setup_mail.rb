ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address              =>  'smtp.sendgrid.net',
    :port                 =>  '587',
    :authentication       =>  :plain,
    :user_name            =>  'apikey',
    :password             =>  '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',
    :domain               =>  'heroku.com',
    :enable_starttls_auto  =>  true
}