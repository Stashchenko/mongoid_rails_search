require 'jquery-ui-rails'
require 'mongoid_rails_search/action_controller'
require 'mongoid_rails_search/railtie'
require 'mongoid_rails_search/version'
require 'mongoid_rails_search/query_builders/query_manager'
require 'mongoid_rails_search/query_builders/mongoid_builder'
require 'mongoid_rails_search/conditions'

require 'mongoid_rails_search/field_builder/field_builder'
require 'mongoid_rails_search/field_builder/type_fields/base_field'
require 'mongoid_rails_search/field_builder/type_fields/boolean_field'
require 'mongoid_rails_search/field_builder/type_fields/date_field'
require 'mongoid_rails_search/field_builder/type_fields/float_field'
require 'mongoid_rails_search/field_builder/type_fields/integer_field'
require 'mongoid_rails_search/field_builder/type_fields/string_field'

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



