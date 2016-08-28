class UserMailer < BaseMandrillMailer
  def welcome(email)
    subject = "Welcome to our awesome app!"
    send_mail(email, subject, "test body")
  end
end