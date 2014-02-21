require 'rack'

class HelloWorld
  def call(env)
    [200, {}, ['Hello World']]
  end
end

Rack::Handler::Thin.run HelloWorld.new
