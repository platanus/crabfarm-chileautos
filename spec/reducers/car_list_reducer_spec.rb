require 'spec_helper'

describe CarListReducer do

  it "gets car results", reducing: "car_list_snapshot" do

    expect(reducer.cars.length).to eq(24)
    car = reducer.cars.first
    expect(car.image).to eq('http://fotos.chileautos.cl/fotos/4594/t_4594959_1.jpg')
    expect(car.model).to eq('Abat 0  knaus 450 techo')
    expect(car.id).to eq('4594959')
    expect(car.year).to eq('1996')
    expect(car.price).to eq('$ 4.800.000')
    expect(car.seller).to eq('Vehiculos Particulares')
    expect(car.city).to eq('Santiago')
    expect(car.published).to eq('el 8-jun-15')
  end

end
