require 'jquery-ui-rails'
require 'mongoid_rails_search/action_controller'
require 'mongoid_rails_search/railtie'
require 'mongoid_rails_search/version'
require 'mongoid_rails_search/query_builder'
require 'mongoid_rails_search/conditions'

require 'mongoid_rails_search/search_form/tag_builder'
require 'mongoid_rails_search/search_form/base_field'
require 'mongoid_rails_search/search_form/date_field'
require 'mongoid_rails_search/search_form/boolean_field'
require 'mongoid_rails_search/search_form/float_field'
require 'mongoid_rails_search/search_form/integer_field'


module MongoidRailsSearch
  module Rails
    class Engine < ::Rails::Engine

    end
  end
end

unless defined?(Boolean)
  class Boolean;
  end
end



