class Honeypot
  def initialize(app)
    @app = app
  end

  def call(env)
    if spambot_submission?(env)
      # return an empty response if there the hidden field was filled
      [200, {'Content-Type' => 'text/html', "Content-Length" => "0"}, []]
    else
      # send the request to the next app in the chain
      # it returns [status, headers, body]
      status, headers, body = @app.call(env)

      # append hidden field to body
      body = insert_honeypot(body)

      # return status, headers and modified body
      [status, headers, body]
    end
  end

  private

  def spambot_submission?(env)
    # check if hidden field was filled
  end

  def insert_honeypot(body)
    # append hidden field to all forms
  end
end
