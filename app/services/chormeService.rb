require 'selenium-webdriver'
require 'interactor'
require_relative 'interactors/scraping_organizer'

class ChromeService
  def initialize
    # Initilize the driver with our desired browser
    @driver = Selenium::WebDriver.for :chrome

    # Define search string
    @search_str = 'carros 4x4 diesel'

    # Navigate to mercadolibre
    @driver.get 'https://www.mercadolibre.com.co'

    # Define global timeout threshold, when @wait is called, if the program
    # takes more than 10 secs to return something, we'll infer that somethig
    # went wrong and execution will be terminated.
    @wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
  end

  def scrape
    # Calling interactor that orchestrates the scraper's logic
    ScrapingOrganizer.call(
        driver: @driver,
        wait: @wait,
        search_str: @search_str
    )
    @driver.quit # Close browser when the task is completed
  end
end
