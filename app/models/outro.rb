class Outro < ActiveRecord::Base
  attr_accessible :detalhes, :gmaps, :latitude, :longitude, :morada, :nome

  acts_as_gmappable

  geocoded_by :morada                # can also be an IP address
  after_validation :geocode, :if => :morada_changed?         # auto-fetch coordinates


  def gmaps4rails_address
    morada
  end

  def gmaps4rails_infowindow
     "Outros: #{nome} <br \>
     #{detalhes}
     "
  end
  
  def gmaps4rails_marker_picture
  {
   "picture" => "/images/outro.png",
   "width" => 32,
   "height" => 37,
  }
end
end
