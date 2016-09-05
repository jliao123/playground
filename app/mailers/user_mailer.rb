class UserMailer < BaseMandrillMailer
  def welcome(email, img_url, name)
    subject = "New request for quote"
    auto_text = true
    inline_css = true
    merge = true
    merge_language = handlebars 
    merge_vars = {
       "name": "products",
          "content": [
              {
                  "img": "http://kbcdn.mandrill.com/nesting-penguin.png",
                  "qty": 2,
                  "sku": "PENG001",
                  "name": "Penguin",
                  "description": "Solid wood, hand-painted penguin nesting doll with 5 different sizes included. Limited Edition.",
                  "price": "12.99",
                  "ordPrice": "25.98"
              },
              {
                  "img": "http://kbcdn.mandrill.com/nesting-bear.png",
                  "qty": 3,
                  "sku": "BBEAR001",
                  "name": "Brown bear",
                  "description": "Solid wood, hand-painted brown bear nesting doll. Coordinates with our entire Bear collection. Includes 6 nested sizes.",
                  "price": "12.99",
                  "ordPrice": "38.97"
              }
          ]
    }
    body = mandrill_template("new-space", merge_vars)
    print "In UserMailer"
    print img_url

    send_mail(email, subject, body)
  end
end