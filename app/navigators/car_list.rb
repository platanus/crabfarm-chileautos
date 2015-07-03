class CarList < Crabfarm::BaseNavigator

  def run
    browser.goto 'www2.chileautos.cl/chileautos.asp'
    if params[:region] == "Metropolitana"
      browser.select_list(name: 'region').select_value("13")
    end

    browser.form(name: 'form_vehiculos').submit

    reduce_with_defaults
  end

end
