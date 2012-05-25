module Rack
  # A heartbeat mechanism for the server. This will add a _/heartbeat_ endpoint
  # that returns status 200 and content OK when executed.
  class Heartbeat
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == '/heartbeat'
        [200, {}, 'OK']
      else
        @app.call(env)
      end
    end
  end
end

require 'heartbeat/railtie' if defined?(Rails)
