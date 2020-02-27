# frozen_string_literal: true

class Api::V1::WidgetsController < ApplicationController

  before_action :set_widget, only: [:show, :update, :destroy]

  def index
    widgets = params[:term].present? ? UserWidget.search(params[:term]) : UserWidget.list
    render_success data: {
        widgets: widgets.as_api_response(:base)
    }
  end

  def visible
    index
  end

  def show
    render_success data:{ widget: @widget.as_api_response(:base)}
  end


  def create
    widget = current_user.widgets.new(widget_params)
    if widget.save
      render_success message:"Widget Created Successfully", data:{widget: widget.as_api_response(:base)}
    else
      render_error message: "Error while creating Widget", data: {error:widget.errors}
    end
  end

  def update
    if @widget.update_attributes(widget_params)
      render_success message: "Widget Updated Successfully", data:{widget: @widget.as_api_response(:base)}
    else
      render_error message:"Error while updating Widget", data:{widget: @widget.errors}
    end
  end

  def destroy
    if @widget.destroy
      render_success message: "Widget Deleted Successfully", data:{widget: @widget.as_api_response(:base)}
    else
      render_error message:"Error while deleting Widget", data:{error: @widget.errors}
    end
  end

  protected

  def set_widget
    @widget = current_user.widgets.find(params[:id])
  end


  def widget_params
    params.require(:widget).permit(:name, :description, :kind)
  end


end