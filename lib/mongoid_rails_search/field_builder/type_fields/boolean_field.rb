module MongoidRailsSearch

  class BooleanField < MongoidRailsSearch::BaseField

    def build(form, field, value, condition)
      form.check_box(field, checked: value == '1' ? true : false)
    end

  end

end