class Route < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :name, presence: true
  validate :station_count

  before_validation :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def station_count
    if railway_stations.size < 2
      errors.add(:base, 'Маршрут дожен содержать минимум две станции')
    end
  end

 end
