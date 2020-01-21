class EventsController < ApplicationController
  # before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
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

  def missing_out
  end

  def club_futuro_vol_1_the_exhibition
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
      :immagine,
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
