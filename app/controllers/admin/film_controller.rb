require 'selenium-webdriver'
require 'interactor'

class Admin::FilmController < Admin::AdminController
  layout "admin"

  def index
    @query = Film.ransack(params[:q])
    @films = @query.result(distinct: true).order(:updated_at).page(params[:page])
  end

  def new
    @film = Film.new
  end

  def create

  end

  def show

  end

  def crawl
    driver = Selenium::WebDriver.for :chrome
    driver.get('https://vuighe.net/urasekai-picnic/tap-1')
    iframe = driver.find_element(:class, 'player-embed')
    @url = iframe.attribute("src").split("url=")[1]
  end

end
