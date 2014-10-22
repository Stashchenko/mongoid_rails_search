module MongoidRailsSearch

  class Railtie < Rails::Railtie
    initializer "mongoid_rails_search.initialize" do
      ActiveSupport.on_load(:action_controller) do
        include MongoidRailsSearch::ActionController
      end
    end
  end

end
