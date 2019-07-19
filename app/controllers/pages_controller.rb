class PagesController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

  def index
    if params[:search]
      if params[:search] != ''
        @movies = search_by_title_and_body(params[:search])
        if @movies.count > 0
          respond_to do |format|
            format.js {render partial: 'search'}
          end
        else
          respond_to do |format|
            format.js {render partial: 'no_search'}
          end
        end
      else
        respond_to do |format|
          format.js {render partial: 'no_search'}
        end
      end
    else
      @movies = Movie.all
      @action = Movie.where(genre: "Action")
      @thriller = Movie.where(genre: "Thriller")
      @comedy = Movie.where(genre: "Comedy")
    end
    from = Email.new(email: 'haristanveer.ht@gmail.com')
    to = Email.new(email: 'ibraheem.ahmed@square63.org')
    subject = 'Sending with SendGrid is Fun'
    content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: "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" )
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end





  def search_by_title_and_body(search)
    Movie.where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end
end
