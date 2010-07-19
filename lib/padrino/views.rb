require 'sinatra/views'
require 'padrino-core'
require 'pp'

module Padrino
  module Views
    
    def self.registered(app)
      app.send(:include, Sinatra::Views::InstanceMethods)
      app.extend(Sinatra::Views::ClassMethods)
      app.send(:include, InstanceMethods)
      app.extend(ClassMethods)
    end
    
    module InstanceMethods
      
      def lookup_module(names)
        controller_names = [request.controller.to_sym] + names
        settings.view_modules[controller_names] || settings.view_modules[names]
      end
      
    end
    
    module ClassMethods
      def view(*names, &block)
        if @_controller
          names.unshift @_controller.first
        end
        super(*names, &block)
      end
    end
    
  end
end