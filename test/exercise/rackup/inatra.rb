module Inatra
  class << self
    @@route = {}
    
    def routes(&block)
      instance_eval(&block)
    end

    def method_missing(method, url)
      method_name = method.to_s.upcase
      if @@route.include?(method_name)
        @@route[method_name][url] = yield
      else
        @@route[method_name] = { url => yield }
      end
    end

    def respond_to_missing?(method, include_private = false)
      @@route.include?(method) || super
    end

    def call(env)
      method_name = env['REQUEST_METHOD']
      path = env['PATH_INFO']
      @@route[method_name][path] || [404, {}, ['Not Found']]
    end
  end
end
