class McsController < ApplicationController
  def index
    @mcs = Mc.all

    render("mc_templates/index.html.erb")
  end

  def show
    @mc = Mc.find(params.fetch("id_to_display"))

    render("mc_templates/show.html.erb")
  end

  def new_form
    @mc = Mc.new

    render("mc_templates/new_form.html.erb")
  end

  def create_row
    @mc = Mc.new

    @mc.rank = params.fetch("rank")
    @mc.guest_id = params.fetch("guest_id")

    if @mc.valid?
      @mc.save

      redirect_back(:fallback_location => "/mcs", :notice => "Mc created successfully.")
    else
      render("mc_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @mc = Mc.find(params.fetch("prefill_with_id"))

    render("mc_templates/edit_form.html.erb")
  end

  def update_row
    @mc = Mc.find(params.fetch("id_to_modify"))

    @mc.rank = params.fetch("rank")
    @mc.guest_id = params.fetch("guest_id")

    if @mc.valid?
      @mc.save

      redirect_to("/mcs/#{@mc.id}", :notice => "Mc updated successfully.")
    else
      render("mc_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @mc = Mc.find(params.fetch("id_to_remove"))

    @mc.destroy

    redirect_to("/mcs", :notice => "Mc deleted successfully.")
  end
end
