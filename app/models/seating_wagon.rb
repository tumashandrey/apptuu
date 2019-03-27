class SeatingWagon < Wagon
  validates :seating, presence: true

  before_validation :set_wagon_class

  private

  def set_wagon_class
    self.wagon_type = 'Сидячие места'
  end
end