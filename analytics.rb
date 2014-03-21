require 'rack'

class HelloWorld
  def call(env)
    body =
      "<html>\n" +
      "  <head></head>\n" +
      "  <body>Hello World</body>\n" +
      "</html>\n"

    [200, {'Content-Type' => 'text/html'}, StringIO.new(body)]
  end
end

class Analytics
  CODE = File.open('analytics.js')

  def initialize
    @app = HelloWorld.new
  end

  def call(env)
    status, headers, body = @app.call(env)
    body = append_code_to(body)
    [status, headers, body]
  end

  private
  def append_code_to(body)
    # append CODE to body
  end
end

Rack::Handler::Thin.run Analytics.new
