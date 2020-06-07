module Inatra
  class << self
    METHODS = %i[get post].freeze

    def routes(&block)
      @route ||= {}
      instance_eval(&block)
    end

    def method_missing(method, url)
      if METHODS.include?(method)
        method_name = method.to_s.upcase
        @route[method_name] ||= {}
        @route[method_name][url] = yield
      else
        super
      end
    end

    def respond_to_missing?(method)
      METHODS.include?(method)
    end

    def call(env)
      method_name = env['REQUEST_METHOD']
      path = env['PATH_INFO']
      @route[method_name][path] || [404, {}, ['Not Found']]
    end
  end
end
