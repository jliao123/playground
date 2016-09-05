ActionMailer::Base.smtp_settings = {
    :address   => ENV.fetch("SMTP_ADDRESS"),
    :port      => 587,
    :user_name => ENV.fetch("SMTP_USERNAME"),
    :password  => ENV.fetch("SMTP_PASSWORD"),
    :domain    => ENV.fetch("SMTP_DOMAIN")
  }
ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = ENV.fetch("SMTP_PASSWORD")
  config.deliver_later_queue_name = :default
end