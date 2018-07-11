require 'open-uri'
require 'pry'

class Scraper

    def self.scrape_index_page(index_url)
        # binding.pry
        array = []
        person = {}
        Nokogiri::HTML(open(index_url)).css(".roster-cards-container .student-card").each do|eachperson|
            person = {
                :name => eachperson.css("h4").text,
                :location => eachperson.css("p").text,
                :profile_url => eachperson.css("a").attribute("href").value
            }
            array.push(person)
        end
        array
    end

    def self.scrape_profile_page(profile_url)
        binding.pry
        profile = {}
        doc = Nokogiri::HTML(open(profile_url)).css(".main-wrapper")
        profile = {
        :twitter => doc.css(".social-icon-container a")[0].attribute("href").value,
        :linkedin => doc.css(".social-icon-container a")[1].attribute("href").value,
        :github => doc.css(".social-icon-container a")[2].attribute("href").value,
        :blog => doc.css(".social-icon-container a")[3].attribute("href").value,
        :profile_quote => doc.css("div.profile-quote").text,
        :bio => doc.css(".description-holder").css("p").text
        }
        profile
        body > div > div.details-container > div.bio-block.details-block > div > div.description-holder > p
        body > div > div.vitals-container > div.social-icon-container > a:nth-child(2)
        body > div > header
        Nokogiri::HTML(open(profile_url)).css(".social-icon-container a").attribute("href").value.include?("github")
    end
end
