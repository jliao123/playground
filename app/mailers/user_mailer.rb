class UserMailer < BaseMandrillMailer
  def welcome(email, img_url)
    subject = "New request for quote"
    merge_vars = {
      "FIRST_NAME" => "Testy Mc'Tester"
      "IMG_TEST" => img_url
    }
    body = mandrill_template("new-space", merge_vars)

    send_mail(email, subject, body)
  end
end

