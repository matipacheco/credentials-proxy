# Credentials Proxy

### A AWS Lambda function Proxy to hide your secret keys!

Lets say you are building your own website.

You are starting your own business.

**You want that money**

One of the first things you need _contact section_ so people can reach you... and since you are a cautious person, you want to hide the Twillio / SendGrid / SES / MailChimp keys you kept in your app's frontend, so that no one uses them for their own benefit.

It's just stupid to set up a dedicated server just to hide your secret keys! A Lambda function serves this purpose perfectly, since you will reach it **only when you need it**, and because, lets face it, **you won't get contacted that much**.

Here's the code for my AWS Lambda function.

    require 'json'
    
    def lambda_handler(event:, context:)
      begin
        body = {
            secret_key: ENV["SECRET_KEY"]
        }.to_json
        
        { statusCode: 200, body: body, errors: nil }
          
      rescue Exception => e
        { statusCode: 500, body: nil, errors: e.to_s }
          
      end
    end

Of course you'll need to set up and API Gateway and shit before you can use it on production, but you get the idea. It just serves environment variables. Yeap, that ~~stupid~~ easy!
  