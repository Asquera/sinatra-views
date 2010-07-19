require 'sinatra/views'
require 'padrino-core'
require 'pp'

module Padrino
  module Views

    ##
    # Main class that register this extension
    #
    def self.registered(app)
      app.send(:include, Sinatra::Views::InstanceMethods)
      app.extend(Sinatra::Views::ClassMethods)
      app.send(:include, InstanceMethods)
      app.extend(ClassMethods)
    end
    
    module InstanceMethods
      def view(*names)
        names.unshift request.match.route.controller.to_sym
        super(*names)
      end
    end
    
    module ClassMethods
      def view(*names, &block)
        names.unshift @_controller.first
        super(*names, &block)
      end
    end
    
  end
end