class CoupeWagon < Wagon
  validates :top_seats, :lower_seats, presence: true

  before_validation :set_wagon_class

  private

  def set_wagon_class
    self.wagon_type = 'Купейный'
  end
end