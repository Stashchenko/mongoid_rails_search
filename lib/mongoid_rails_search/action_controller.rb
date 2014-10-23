module MongoidRailsSearch

  module ActionController

    extend ActiveSupport::Concern


    included do
      include ClassMethods
      helper HelperMethods
      helper LocalizationHelper
    end

    module ClassMethods

      def search_request
        return nil if params[:search].blank?
        params_condition = params[:condition].dup if params[:condition].present?
        params_search = params[:search].dup if params[:search].present?
        params_type = params[:types].dup if params[:types].present?
        klass = Object.const_get params_search[:object_class]

        @query_builder = MongoidRailsSearch::QueryManager.new(MongoidRailsSearch::MongoidBuilder.new)
        query = @query_builder.build(params_search, params_condition, params_type)

        return klass unless query.present?
        return klass.where(query)
      end

    end

  end

  module HelperMethods

    def search_form(object_class, fields = [], options = {})
      options[:class] ||= 'width_full'
      options[:method] ||= 'get'
      options[:url] ||= "/#{params[:controller]}"
      fields -= %W(_id)
      @object_class = object_class
      @options = options
      new_fields = []
      fields.each { |param| new_fields << param.to_s }
      @fields = new_fields
      render partial: 'mongoid_rails_search/search_form'
    end

    def generate_tag(form, field)
      field_type= @object_class.fields[field.to_s].try(:type)
      return if field_type.blank?
      condition = get_condition_value(field)
      value = get_search_value(field)
      MongoidRailsSearch::FieldBuilder.new(form, field_type, condition, value, field).build
    end


    private

    def get_search_value(field)
      params[:search].present? && params[:search][field].present? ? params[:search][field] : ''
    end

    def get_condition_value(field)
      params[:condition].present? && params[:condition][field].present? ? params[:condition][field] : ''
    end

  end


  module LocalizationHelper

    def tf(model, field)
      clazz = model.is_a?(Class) ? model : model.class
      translate(field, scope: [:models, clazz.name.underscore])
    end

    def t_pluralize(key, options ={})
      count = options[:count]
      if count >= 2 && count <= 4
        return I18n.translate("#{key}.few", options)
      end
      I18n.translate(key, options)
    end

  end

end