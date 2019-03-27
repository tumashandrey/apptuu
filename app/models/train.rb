class Train < ActiveRecord::Base
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true, uniqueness: true

  def get_econom_class
    self.wagons.where(wagon_type: 'плацкартный').count
  end

  def get_compartment
    self.wagons.where(wagon_type: 'купейный').count
  end

  def get_econom_seats
    get_seats('плацкартный')
  end

  def get_compartment_seats
    get_seats('купейный')
  end

  def get_seats(type)
    lower_seats = self.wagons.where(wagon_type: type).sum(:lower_seats)
    top_seats = self.wagons.where(wagon_type: type).sum(:top_seats)
    "#{top_seats}/#{lower_seats}"
  end

end
