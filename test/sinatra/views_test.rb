require 'sinatra/views'

class SinatraTest < Sinatra::Base
  register Sinatra::Views
  set :environment, :test
  
  get '/' do
    view :list, :format => :html
  end
  
  get '/foo.:format' do
    view :list
  end 
  
  view :list do
    def html
      'test/hoge'
    end
  end
end

class AmbivalenceTest < Sinatra::Base
  register Sinatra::Views
  set :environment, :test
  
  get '/' do
    view :list, :format => :html
  end
  
  get '/foo.:format' do
    view :list
  end
  
  def html
    'test/fuge'
  end
  
  view :list do
    def html
      'test/hoge'
    end
  end  
end

context "Sinatra app class with views extension" do
  app SinatraTest
  
  asserts "the list view" do
    topic.view_modules[[:list]]
  end.kind_of(Module)
  
  asserts "the list views methods" do
    topic.view_modules[[:list]].instance_methods.map(&:to_s)
  end.includes("html")
end

context "Full sinatra app" do
  app SinatraTest
  
  context "with explicit view format" do
    setup { get '/' }
    
    asserts(:body).equals('test/hoge')
  end
  
  context "with implicit view format" do
    setup { get '/foo.html' }
    
    asserts(:body).equals('test/hoge')
  end
end


context "Ambivalent app" do
  app AmbivalenceTest
  
  context "with explicit view format" do
    setup { get '/' }
    
    asserts(:body).equals('test/hoge')
  end
  
  context "with implicit view format" do
    setup { get '/foo.html' }
    
    asserts(:body).equals('test/hoge')
  end
end