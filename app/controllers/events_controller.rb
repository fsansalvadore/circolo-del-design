class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :eventi_passati]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = " \
        events.titolo ILIKE :query \
        OR events.sottotitolo ILIKE :query \
        OR events.descrizione ILIKE :query \
        OR events.categoria ILIKE :query \
      "
      @events = Event.where("published = ? AND data_fine > ?", true, Date.today).where(sql_query, query: "%#{params[:query]}%")
    else
      @events = Event.where("published = ? AND data_fine > ?", true, Date.today).order(:data_inizio)
    end

    @featured = Event.all.select { |e| e.featured }
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)

    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def eventi_passati
    if params[:query].present?
      sql_query = " \
        events.titolo ILIKE :query \
        OR events.sottotitolo ILIKE :query \
        OR events.descrizione ILIKE :query \
        OR events.categoria ILIKE :query \
      "
      @events = Event.where("published = ? AND data_fine < ?", true, Date.today).where(sql_query, query: "%#{params[:query]}%")
    else
      @events = Event.where("published = ? AND data_fine < ?", true, Date.today).order(:data_inizio)
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :titolo,
      :sottotitolo,
      :data_inizio,
      :data_fine,
      :orario,
      :prezzo,
      :descrizione,
      :photo,
      :image,
      :categoria,
      :luogo,
      :durata,
      :posti,
      :target,
      :link,
      :published,
      :featured
      )
  end

end
