module MongoidRailsSearch

  class TagBuilder

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
      elsif @field_name.include?('email')
        result = @form.email_field(@field_name, value: @value)
      else
        result= @form.text_field(@field_name, value: @value)
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
    end
  end


end
