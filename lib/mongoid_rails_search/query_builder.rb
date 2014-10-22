module MongoidRailsSearch

  class QueryBuilder


    def build(params_search, params_condition, params_type)
      return false unless params_search.present? && params_search[:object_class].present?
      delete_empty_params!(params_search)

      params_search.each do |k, v|
        if params_condition.present? && params_condition[k].present?
          search_condition = {}
          if params_condition[k] == MongoidRailsSearch::Conditions::EQUAL
            search_condition= generate_by_type(k, params_search, params_type)
          else
            search_condition["$#{params_condition[k]}"]= params_search[k]
          end
          params_search[k]=search_condition
        end
      end
      return params_search
    end

    def generate_by_type(k, params_search, params_type)
      result = {}
      if params_type[k] == 'Date'
        date = Date.strptime(params_search[k], '%Y-%m-%d')
        result['$gte']= date
        result['$lt']= date.tomorrow
      else
        result = params_search[k]
      end
      result
    end


    private

    def delete_empty_params!(params)
      params.delete(:object_class)
      params.delete_if { |k, v| v.blank? }
    end
  end

end
