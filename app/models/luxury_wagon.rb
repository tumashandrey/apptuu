class LuxuryWagon < Wagon
  validates :lower_seats, presence: true

  before_validation :set_wagon_class

  private

  def set_wagon_class
    self.wagon_type = 'СВ Вагон'
  end
end