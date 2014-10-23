module MongoidRailsSearch

  class StringField < MongoidRailsSearch::BaseField

    def build(form, field, value, condition)
      str_fields = form.text_field(field, value: value)
      str_fields += hidden_field(:types, field, value: String)
      str_fields += select(:condition, field, options_for_select(MongoidRailsSearch::Conditions::STRING_CONDITIONS, condition))
    end

  end

end