Views for Sinatra and Padrino
=============================

sinatra-views provides a view implementation inspired by Agavi to Sinatra and Padrino. This saves the hassle of implementing special functionality based on content types on your own.

Example
-------

    class MyApp < Sinatra::Base
      register Sinatra::Views
      
      get '/' do
        #do something and retrieve @data
        view :success
      end
      
      error NotFoundError do
        view :error
      end
      
      view :success do
        def html
          render 'template'
        end
        
        def xml
          @data.to_xml
        end
        
        def json
          @data.to_json
        end
      end
      
      view :error do
        def html
          status 404
          render 'error_template'
        end
        
        def xml
          status 404 
        end
        
        def json
          status 404
        end
      end
    end

View names can be Arrays, so namespacing views is easy:

    class MyApp
      view :viewA, :success do
      
      end
      
      view :viewB, :success do
      
      end
    end
    
Padrino
-------

Sinatra::Views is also available as a special extension for Padrino. Padrino users are advised to install and require `padrino-views` and then register `Padrino::Views` instead. This provides automatic namespacing by controller. Views defined within a controller will be used when calling `view` inside a controller context. Views defined outside of a controller are global and can be accessed from everywhere, as long as there is no controller view of the same name.