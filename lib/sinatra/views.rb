module Sinatra
  module Views

    def self.registered(app)
      app.send(:include, InstanceMethods)
      app.extend(ClassMethods)
    end
    
    module InstanceMethods
      def lookup_module(names)
        settings.view_modules[names]
      end
      
      def view(*names)
        opts = names.last.kind_of?(Hash) ? names.pop : {}
        format = opts[:format] || params[:format]
        mod = lookup_module(names)
        extend mod
        send format
      end
    end
    
    module ClassMethods
      
      def self.extended(app)
        app.set :view_modules, {}
      end
      
      def view(*names, &block)
        view_modules[names] ||= Module.new
        view_modules[names].class_eval(&block)
      end
    end
    
  end
end