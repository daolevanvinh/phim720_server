require 'selenium-webdriver'
require 'interactor'

class Admin::FilmController < Admin::AdminController
  layout "admin"

  def index
    @query = Film.ransack(params[:q])
    @films = @query.result(distinct: true).order(:updated_at).page(params[:page]).per(10)
  end

  def new
    @film = Film.new
  end

  def create

  end

  def show

  end

  def crawl(driver = nil, l_film = nil)
    driver = driver || Selenium::WebDriver.for(:chrome)
    film = l_film || Film.find(params[:id])
    newest_ep = Film
                    .select("films.id, MAX(episodes.index) as newest")
                    .where("films.id = ?", film.id)
                    .left_joins(seasons: :episodes)
                    .group("films.id")
                    .first
                    .newest
    index = (newest_ep || 0) + 1
    while true
      # pass episode already save
      begin
        driver.get("#{film.crawl_link}/tap-#{index}")
        sleep(2.seconds)
        # find element
        iframe = driver.find_element(:class, "player-embed")
        select = driver.find_element(:id, "season-active")
        current_ep = driver.find_element(:name, "current-episode").attribute('value')
        # break when done (url always to ep1 when index out of range)
        if ((index > 1) && current_ep.to_i == 1) || driver.current_url.include?("tap-0")
          break
        end
        # handle get data
        url = iframe.attribute("src").split("url=")[1]
        season_title = select.attribute("class").include?("hidden") ? 1 : select.find_element(:class, "season-name").text.gsub(/[^0-9]/, '')

        # save data
        season = Season.find_or_create_by(title: season_title, film_id: film.id)
        Episode.create(title: index, index: index, season_id: season.id, link: url)
      rescue
        break
      end
      index += 1
    end
  end

  def crawl_all
    driver = Selenium::WebDriver.for :chrome
    driver.get('https://vuighe.net/bang-xep-hang')
    #get top anime
    tops_anime = driver.find_elements(:class, "tray-item")
    tops_anime.each do |anime|
      film = Film.find_or_create_by(name: anime.find_element(:class, "tray-item-title").text)
      film.crawl_link = anime.find_element(:tag_name, "a").attribute("href")
      film.thumbnail = anime.find_element(:class, "tray-item-thumbnail").attribute("src")
      film.save
    end
    #every anime, go to crawl link get data
    films = Film.order(:updated_at)
    films.each do |film|
      crawl(driver, film)
    end
    redirect_to action: :index
  end

end
