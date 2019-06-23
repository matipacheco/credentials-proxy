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
