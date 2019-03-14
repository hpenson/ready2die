class RolesController < ApplicationController
  def index
    @q = Role.ransack(params[:q])
    @roles = @q.result(:distinct => true).includes(:guest, :user).page(params[:page]).per(10)

    render("role_templates/index.html.erb")
  end

  def show
    @role = Role.find(params.fetch("id_to_display"))

    render("role_templates/show.html.erb")
  end

  def new_form
    @role = Role.new

    render("role_templates/new_form.html.erb")
  end

  def create_row
    @role = Role.new

    @role.kind = params.fetch("kind")
    @role.description = params.fetch("description")
    @role.rank = params.fetch("rank")
    @role.guest_id = params.fetch("guest_id")

    if @role.valid?
      @role.save

      redirect_back(:fallback_location => "/roles", :notice => "Role created successfully.")
    else
      render("role_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_guest
    @role = Role.new

    @role.kind = params.fetch("kind")
    @role.description = params.fetch("description")
    @role.rank = params.fetch("rank")
    @role.guest_id = params.fetch("guest_id")

    if @role.valid?
      @role.save

      redirect_to("/guests/#{@role.guest_id}", notice: "Role created successfully.")
    else
      render("role_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @role = Role.find(params.fetch("prefill_with_id"))

    render("role_templates/edit_form.html.erb")
  end

  def update_row
    @role = Role.find(params.fetch("id_to_modify"))

    @role.kind = params.fetch("kind")
    @role.description = params.fetch("description")
    @role.rank = params.fetch("rank")
    @role.guest_id = params.fetch("guest_id")

    if @role.valid?
      @role.save

      redirect_to("/roles/#{@role.id}", :notice => "Role updated successfully.")
    else
      render("role_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_guest
    @role = Role.find(params.fetch("id_to_remove"))

    @role.destroy

    redirect_to("/guests/#{@role.guest_id}", notice: "Role deleted successfully.")
  end

  def destroy_row
    @role = Role.find(params.fetch("id_to_remove"))

    @role.destroy

    redirect_to("/roles", :notice => "Role deleted successfully.")
  end
end
