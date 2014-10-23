module MongoidRailsSearch

  class FloatField < MongoidRailsSearch::BaseField


    def build(form, field, value, condition)
      form.number_field(field, step: 0.001, value: value)
    end

  end

end