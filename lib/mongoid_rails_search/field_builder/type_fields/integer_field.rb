module MongoidRailsSearch

  class IntegerField < MongoidRailsSearch::BaseField
    def build(form, field, value, condition)
      str_fields= form.number_field(field, value: value)
      # str_fields += hidden_field(:types, field, value: Integer)
      # str_fields += select(:condition, field, options_for_select(MongoidRailsSearch::Conditions::CONDITIONS, condition))
    end

  end

end