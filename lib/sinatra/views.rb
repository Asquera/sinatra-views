require 'sinatra'

module Sinatra
  module Views

    ##
    # Main class that register this extension
    #
    def self.registered(app)
      app.send(:include, InstanceMethods)
      app.extend(ClassMethods)
    end
    
    module InstanceMethods
      def view(*names)
        opts = names.last.kind_of?(Hash) ? names.pop : {}
        format = opts[:format] || params[:format]
        mod = settings.view_modules[names]
        extend mod
        send format
      end
    end
    
    module ClassMethods
      
      def self.extended(app)
        app.set :view_modules, Hash.new {|h,k| h[k] = Module.new }
      end
      
      def view(*names, &block)
        view_modules[names].class_eval(&block)
      end
    end
    
  end
end