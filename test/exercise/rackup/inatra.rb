module Inatra
  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def method_missing(method, url)
      method_name = method.to_s.upcase
      @route ||= {}
      if @route.key?(method_name)
        @route[method_name][url] = yield
      else
        @route[method_name] = { url => yield }
      end
    end

    def call(env)
      method_name = env['REQUEST_METHOD']
      path = env['PATH_INFO']
      @route[method_name][path]
    end
  end
end
