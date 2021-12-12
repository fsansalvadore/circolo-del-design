class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :eventi_passati, :get_events_by_month]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where("published = ? AND data_fine >= ?", true, Date.today).where.not(is_not_in_calendar: true)
    if params[:query].present?
      sql_query = " \
        events.titolo ILIKE :query \
        OR events.sottotitolo ILIKE :query \
        OR events.descrizione ILIKE :query \
        OR events.categoria ILIKE :query \
      "
      @events = @events.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:i].present?
      @events = Event.where('extract(year from data_inizio) = ? OR extract(year from data_fine) = ?', Time.new.year, Time.new.year).where("extract(month from data_inizio) <= ? AND extract(month from data_fine) >= ?", params[:i], params[:i]).where("published = ?", true).where.not(is_not_in_calendar: true).order(:data_inizio)
      @monthSelect = params[:i]
    elsif params[:categoria].present?
      @events = params[:categoria] == "all" ? Event.where("published = ? AND data_fine > ?", true, Date.today).where.not(is_not_in_calendar: true).order(:data_inizio) : Event.where("categoria = ? AND published = ?", params[:categoria].gsub("+", " "), true).where('extract(year from data_inizio) = ? OR extract(year from data_fine) = ?', Time.new.year, Time.new.year).where.not(is_not_in_calendar: true).order(:data_inizio)
      @categorySelect = params[:categoria]
    else
      @events = @events.order(:data_inizio)
    end

    @featured = Event.where("categoria = 'Mostra' AND data_inizio <= ? AND data_fine >= ? OR featured = true", Date.today, Date.today).where(published: true)
  end

  def get_events_by_month
    @events = Event.where("published = ?", true).where("data_inizio OR data_fine = ?", params[:i])
  end

  def show
    @event_blocks = EventBlock.where("visible = true AND event_id = ?", @event.id).order(:position)
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
    @event.slug = nil if @event.titolo != params[:titolo]
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
    @event = Event.friendly.find_by_slug(params[:slug])
  end

  def event_params
    params.require(:event).permit(
      :titolo,
      :sottotitolo,
      :data_inizio,
      :data_fine,
      :slug,
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
      :featured,
      :priority
      )
  end

end
