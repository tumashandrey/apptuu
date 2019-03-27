class EconomyWagon < Wagon
  validates :top_seats, :side_top_seats, :lower_seats, :side_bottom_seats, presence: true

  before_validation :set_wagon_class

  private

  def set_wagon_class
    self.wagon_type = 'Плацкартный'
  end

end