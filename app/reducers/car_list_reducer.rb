require "ostruct"
class CarListReducer < Crabfarm::BaseReducer

  has_field :cars

  def run
    self.cars = car_list.map {|car| parse_car car }
  end

  def car_list
    @car_list ||= css('#results tr[onclick^="location.href"]')
  end

  def parse_car(car_html)

    car = Car.new

    car.image = car_html.at_css("img").attr("src")
    car.model = car_html.at_css("td:eq(2) a").text
    car.id = get_id(car_html.at_css("td:eq(2) a").attr("href"))
    car.year = car_html.at_css("td:eq(3)").text
    car.price = car_html.at_css("td:eq(4)").text
    car.seller = car_html.at_css("td:eq(5)").text
    car.city = get_city(car_html.at_css("td:eq(6)").text)
    car.published = get_published(car_html.at_css("td:eq(6)").text)

    car
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
