require "mandrill"

class BaseMandrillMailer < ActionMailer::Base
  default(
    from: "g@sftip.com",
    reply_to: "g@sftip.com"
  )

  private

  def send_mail(email, subject, body)
    mail(to: email, subject: subject, body: body, content_type: "text/html")
  end

  def mandrill_template(template_name, attributes)
    mandrill = Mandrill::API.new(ENV["SMTP_PASSWORD"])
    merge_language = "handlebars"
    merge_vars = attributes.map do |key, value|
      { name: key, content: value }



    end

    mandrill.templates.render(template_name, [], merge_vars, merge_language)["html"]
  end
end