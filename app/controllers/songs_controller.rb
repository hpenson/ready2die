class SongsController < ApplicationController
  before_action :current_user_must_be_song_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_song_user
    song = Song.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == song.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.songs.ransack(params[:q])
    @songs = @q.result(:distinct => true).includes(:user, :service).page(params[:page]).per(10)

    render("song_templates/index.html.erb")
  end

  def show
    @song = Song.find(params.fetch("id_to_display"))

    render("song_templates/show.html.erb")
  end

  def new_form
    @song = Song.new

    render("song_templates/new_form.html.erb")
  end

  def create_row
    @song = Song.new

    @song.title = params.fetch("title")
    @song.artist = params.fetch("artist")
    @song.rank = params.fetch("rank")
    @song.user_id = params.fetch("user_id")

    if @song.valid?
      @song.save

      redirect_back(:fallback_location => "/songs", :notice => "Song created successfully.")
    else
      render("song_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @song = Song.find(params.fetch("prefill_with_id"))

    render("song_templates/edit_form.html.erb")
  end

  def update_row
    @song = Song.find(params.fetch("id_to_modify"))

    @song.title = params.fetch("title")
    @song.artist = params.fetch("artist")
    @song.rank = params.fetch("rank")
    

    if @song.valid?
      @song.save

      redirect_to("/songs/#{@song.id}", :notice => "Song updated successfully.")
    else
      render("song_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @song = Song.find(params.fetch("id_to_remove"))

    @song.destroy

    redirect_to("/users/#{@song.user_id}", notice: "Song deleted successfully.")
  end

  def destroy_row
    @song = Song.find(params.fetch("id_to_remove"))

    @song.destroy

    redirect_to("/songs", :notice => "Song deleted successfully.")
  end
end
