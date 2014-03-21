require 'rack'

class Env
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, env.inspect ]
  end
end

Rack::Handler::Thin.run Env.new, Port: 5000
