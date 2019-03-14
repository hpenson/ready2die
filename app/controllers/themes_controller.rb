class ThemesController < ApplicationController
  def index
    @themes = Theme.page(params[:page]).per(10)

    render("theme_templates/index.html.erb")
  end

  def show
    @service = Service.new
    @theme = Theme.find(params.fetch("id_to_display"))

    render("theme_templates/show.html.erb")
  end

  def new_form
    @theme = Theme.new

    render("theme_templates/new_form.html.erb")
  end

  def create_row
    @theme = Theme.new

    @theme.rank = params.fetch("rank")

    if @theme.valid?
      @theme.save

      redirect_back(:fallback_location => "/themes", :notice => "Theme created successfully.")
    else
      render("theme_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @theme = Theme.find(params.fetch("prefill_with_id"))

    render("theme_templates/edit_form.html.erb")
  end

  def update_row
    @theme = Theme.find(params.fetch("id_to_modify"))

    @theme.rank = params.fetch("rank")

    if @theme.valid?
      @theme.save

      redirect_to("/themes/#{@theme.id}", :notice => "Theme updated successfully.")
    else
      render("theme_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @theme = Theme.find(params.fetch("id_to_remove"))

    @theme.destroy

    redirect_to("/themes", :notice => "Theme deleted successfully.")
  end
end
