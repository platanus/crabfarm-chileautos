require 'spec_helper'

describe CarList do

  it "shows the car list", navigating: 'car_search', live: true do
    navigate region: "Metropolitana"
    expect(browser.label.text.include? "R.M.")
  end

end
