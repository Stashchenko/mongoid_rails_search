module MongoidRailsSearch

  class FieldBuilder

    def initialize(form, field_type, condition, value, field_name)
      @form = form
      @field_type = field_type
      @condition = condition
      @value = value
      @field_name = field_name
      initialize_tags
    end

    def build
      tag_builder = @tag_builders[@field_type]
      if tag_builder
        result= tag_builder.build(@form, @field_name, @value, @condition)
      else
        result = @tag_builders[String].build(@form, @field_name, @value, @condition)
      end
      result
    end

    private

    def initialize_tags
      @tag_builders= {}
      @tag_builders[Time]= MongoidRailsSearch::DateField.new
      @tag_builders[Date]= MongoidRailsSearch::DateField.new
      @tag_builders[Integer]= MongoidRailsSearch::IntegerField.new
      @tag_builders[Float]= MongoidRailsSearch::FloatField.new
      @tag_builders[Boolean]= MongoidRailsSearch::BooleanField.new
      @tag_builders[String]= MongoidRailsSearch::StringField.new
    end
  end


end
