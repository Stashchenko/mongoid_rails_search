module MongoidRailsSearch

  module ActionController

    extend ActiveSupport::Concern


    included do
      include ClassMethods
      helper HelperMethods
    end

    module ClassMethods

      def search_request
        params_condition = params[:condition].dup if params[:condition].present?
        params_search = params[:search].dup if params[:search].present?
        params_type = params[:types].dup if params[:types].present?
        klass = Object.const_get params_search[:object_class]

        @query_builder = MongoidRailsSearch::QueryBuilder.new
        query = @query_builder.build(params_search, params_condition, params_type)

        return false unless query.present?
        return klass.where(query)
      end
    end

  end

  module HelperMethods


    def search_form(object_class, fields = [], options = {})
      options[:class] ||= 'width_full'
      options[:method] ||= 'get'
      options[:url] ||= "/#{params[:controller]}"
      @values ||={}
      fields -= %W(_id)
      @object_class = object_class
      @options = options
      new_fields = []
      fields.each { |param| new_fields << param.to_s }
      @fields = new_fields
      render partial: 'mongoid_rails_search/search_form'
    end


    def generate_field(form, field)
      field_type= @object_class.fields[field.to_s].type
      condition = params[:condition].present? && params[:condition][field].present? ? params[:condition][field] : ''
      value = get_search_value(field)
      if field_type == Time || field_type == Date
        str_fields= form.text_field(field, value: value, class: 'datepicker')
        str_fields += hidden_field(:types, field, value: Date)
        str_fields += select(:condition, field, options_for_select(MongoidRailsSearch::Conditions::CONDITIONS, condition))
      elsif field_type == Boolean
        form.check_box(field, checked: value == '1' ? true : false)
      elsif field_type == Integer
        form.number_field(field, value: value)
      elsif field_type == Float
        form.number_field(field, step: 0.001, value: value)
      elsif field.include?('email')
        form.email_field(field, value: value)
      else
        form.text_field(field, value: value)
      end
    end

    private

    def get_search_value(field)
      value = params[:search].present? && params[:search][field].present? ? params[:search][field] : ''
    end

  end

end