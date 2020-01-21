class Event < ApplicationRecord
  validates :titolo, :sottotitolo, :immagine, :prezzo, :descrizione, presence: true
end
