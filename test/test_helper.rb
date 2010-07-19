require 'rack/test'
require 'riot'
require 'sinatra/base'

# Specify your app using the #app helper inside a context.
# If you don't specify one, Riot::Rack will recursively look for a config.ru file.
# Takes either an app class or a block argument.
# app { Padrino.application }
# app { Testtest.tap { |app| } }

class Riot::Situation
  include Rack::Test::Methods

  # The Rack app under test.
  def app
    @app
  end
end

class Riot::Context
  # Set the Rack app which is to be tested.
  #
  #   context "MyApp" do
  #     app { [200, {}, "Hello!"] }
  #     setup { get '/' }
  #     asserts(:status).equals(200)
  #   end
  def app(app=nil, &block)
    setup { @app = (app || block) }
  end
end