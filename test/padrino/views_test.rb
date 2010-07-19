class PadrinoTest < Padrino::Application
  register Padrino::Views
  set :environment, :test
  
  controller :test do
    get '/' do
      view :list, :format => :html
    end
    
    get '/foo', :provides => [:html] do
      view :list
    end 
  end
  
  controller :test do
    view :list do
      def html
        'test/hoge'
      end
    end
  end
end


context "Padrino app class with views extension" do
  app PadrinoTest
  
  asserts "the list view" do
    topic.view_modules[[:test, :list]]
  end.kind_of(Module)
  
  asserts "the list views methods" do
    puts topic.view_modules
    topic.view_modules[[:test, :list]].instance_methods
  end.includes(:html)
end

context "Full padrino app" do
  app PadrinoTest
  
  context "with explicit view format" do
    setup { get 'test/' }
    
    asserts(:body).equals('test/hoge')
  end
  
  context "with implicit view format" do
    setup { get 'test/foo.html' }
    
    asserts(:body).equals('test/hoge')
  end
end