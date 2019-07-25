class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@asli-imdb.herokuapp.com'
  layout 'mailer'
end
