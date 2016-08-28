class UserMailer < BaseMandrillMailer
  def welcome(email)
    subject = "New request for quote"
    merge_vars = {
      "FIRST_NAME" => "Testy Mc'Tester"
    }
    body = mandrill_template("new-space", merge_vars)

    send_mail(email, subject, body)
  end
end

