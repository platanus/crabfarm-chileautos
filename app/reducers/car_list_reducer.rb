require "ostruct"
class CarListReducer < Crabfarm::BaseReducer

  has_field :cars

  def run
    self.cars = car_list.map {|car| parse_car car }
  end

  def car_list
    @car_list ||= css('#results tr[onclick^="location.href"]')
  end

  def parse_car(car)

    OpenStruct.new({
      image: car.at_css("img").attr("src"),
      model: car.at_css("td:eq(2) a").text,
      id: get_id(car.at_css("td:eq(2) a").attr("href")),
      year: car.at_css("td:eq(3)").text,
      price: car.at_css("td:eq(4)").text,
      seller: car.at_css("td:eq(5)").text,
      city: get_city(car.at_css("td:eq(6)").text),
      published: get_published(car.at_css("td:eq(6)").text)
    })
  end

  def get_id(url)
    url.split("=").last
  end

  def to_utf(data)
    data.force_encoding("ISO-8859-1").encode("UTF-8")
  end

  def get_city(td)
    to_utf(td).split("publicado").first
  end

  def get_published(td)
    to_utf(td).split("publicado").last.strip
  end

end
