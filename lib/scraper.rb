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
        # doc = Nokogiri::HTML(open(profile_url)).
        # profile = {
        # :twitter => doc.css(".social-icon-container a")[0].attribute("href").value,
        # :linkedin => doc.css(".social-icon-container a")[1].attribute("href").value,
        # :github => doc.css(".social-icon-container a")[2].attribute("href").value,
        # :blog => doc.css(".social-icon-container a")[3].attribute("href").value,
        # :profile_quote => doc.css("div.profile-quote").text,
        # :bio => doc.css(".description-holder").css("p").text
        # }
        # profile
        # Nokogiri::HTML(open(profile_url)).css(".social-icon-container a").attribute("href").value.include?("github")
        # Nokogiri::HTML(open(profile_url)).css(".social-icon-container a").map do |person|
        #     person["href"].
        # array = {}
        link = Nokogiri::HTML(open(profile_url)).css(".social-icon-container a")
        links.map {|link| link.attribute('href').value}.drop_while{|link| !link.include?("https")}.each do|link|
            if link.include?("twitter")
                twitter = link
            elsif link.include?("linkedin")
                linkedin =  link
            elsif link.include?("github")
                github =  link
            elsif !link.include?("twitter") && !link.include?("github") && !link.include?("linkedin")
                blog =  link
            end
        end
        # array
    end
end
