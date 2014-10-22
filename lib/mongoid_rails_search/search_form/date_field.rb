module MongoidRailsSearch

  class DateField < MongoidRailsSearch::BaseField

    def build(form, field, value, condition)
      str_fields= form.text_field(field, value: value, class: 'datepicker')
      str_fields += hidden_field(:types, field, value: Date)
      str_fields += select(:condition, field, options_for_select(MongoidRailsSearch::Conditions::CONDITIONS, condition))
    end

  end

end