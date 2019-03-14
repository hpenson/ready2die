class ExpressionsController < ApplicationController
  before_action :current_user_must_be_expression_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_expression_user
    expression = Expression.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == expression.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @expressions = current_user.expressions.page(params[:page]).per(10)

    render("expression_templates/index.html.erb")
  end

  def show
    @expression = Expression.find(params.fetch("id_to_display"))

    render("expression_templates/show.html.erb")
  end

  def new_form
    @expression = Expression.new

    render("expression_templates/new_form.html.erb")
  end

  def create_row
    @expression = Expression.new

    @expression.kind = params.fetch("kind")
    @expression.description = params.fetch("description")
    @expression.rank = params.fetch("rank")
    @expression.service_id = params.fetch("service_id")
    @expression.user_id = params.fetch("user_id")

    if @expression.valid?
      @expression.save

      redirect_back(:fallback_location => "/expressions", :notice => "Expression created successfully.")
    else
      render("expression_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @expression = Expression.find(params.fetch("prefill_with_id"))

    render("expression_templates/edit_form.html.erb")
  end

  def update_row
    @expression = Expression.find(params.fetch("id_to_modify"))

    @expression.kind = params.fetch("kind")
    @expression.description = params.fetch("description")
    @expression.rank = params.fetch("rank")
    @expression.service_id = params.fetch("service_id")
    

    if @expression.valid?
      @expression.save

      redirect_to("/expressions/#{@expression.id}", :notice => "Expression updated successfully.")
    else
      render("expression_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @expression = Expression.find(params.fetch("id_to_remove"))

    @expression.destroy

    redirect_to("/users/#{@expression.user_id}", notice: "Expression deleted successfully.")
  end

  def destroy_row
    @expression = Expression.find(params.fetch("id_to_remove"))

    @expression.destroy

    redirect_to("/expressions", :notice => "Expression deleted successfully.")
  end
end
