class CultivatedArea < ActiveRecord::Base
  
  before_save :set_province

  belongs_to :plantation
  belongs_to :soil_type
  belongs_to :area_type
  belongs_to :province
  belongs_to :user

  has_many :notifications

  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true

  def set_province
	  key = 'Avpc63XswtAtVf7RumTfFo-GXAybbIuSXc1XIFkpdDbtG1haxQ9bkpGaslb6AGFp'
    Geocoder.configure(:lookup => :bing, :api_key => key)
    lat = self.latitude
    lon = self.longitude
    lat_lon_s = lat.to_s + "," + lon.to_s
    result = Geocoder.search(lat_lon_s).first 
    unless result.nil?
      p result.address_data['locality']
      self.province = Province.find_by_name(result.address_data['locality'])
    end
  end


end

