class BaseController < ApplicationController
  attr_reader :resource, :collection, :item
  helper_method :resource, :collection, :item, :resource_name

  before_action :set_resource
  before_action :set_item, only: [:show, :destroy, :update, :edit]
  before_action :set_collection, only: [:index]

  def new
    @item = resource.new
  end

  def create
    @item = resource.new(permit_params)

    if item.save
      redirect_to public_send(root_resource_path)
    else
      render :new
    end
  end

  def destroy
    item.destroy
  end

  def resource_name
    @resource_name ||= self.class.name.match(/^(?<model_klass>\w+)Controller$/)[:model_klass].singularize
  end

  private

  def set_resource
    @resource = resource_name.camelcase.constantize
  end

  def set_item
    @item = resource.find(params[:id])
  end

  def set_collection
    @collection = resource.all
  end

  def permit_params
    raise NotImplemented
  end

  def root_resource_path
    "#{resource_name.downcase.pluralize}_path"
  end

  def resource_path
    "#{resource_name}_path"
  end
end
