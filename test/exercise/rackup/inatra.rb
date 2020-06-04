module Inatra
  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def method_missing(method, url)
      @route ||= {}
      method_name = method.to_s.upcase
      @route[method_name] ||= {}
      @route[method_name][url] = yield
    end

    def call(env)
      method_name = env['REQUEST_METHOD']
      path = env['PATH_INFO']
      @route[method_name][path] || [404, {}, ['Not Found']]
    end
  end
end
