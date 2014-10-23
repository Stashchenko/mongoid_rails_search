module MongoidRailsSearch

  class QueryManager

    def initialize(builder)
      @builder= builder
    end

    def build(params_search, params_condition, params_type)
      @builder.build(params_search, params_condition, params_type)
    end

  end

end
