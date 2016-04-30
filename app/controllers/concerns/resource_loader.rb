module ResourceLoader
  extend ActiveSupport::Concern

  included do
    private

    def set_resource
      resource = controller_name.classify.constantize.find(params[:id])
      instance_variable_set("@#{controller_name.singularize}", resource)
    end
  end
end