require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'pry'



PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_the_email_of_a_townhall_from_its_webpage(url)
    page = Nokogiri::HTML(open(url))
    mail = page.css('td p font')
    mail.each do |mail|
    if mail.text.include?('@')
        @mailmairie = mail.text
        
       
    end
    end
end


def get_all_the_urls_of_val_doise_townhalls
	page = Nokogiri::HTML(open(PAGE_URL))
    adress = page.css('.lientxt')
    adress.each do |adress|
   		urladress = adress['href']
        urladress[0]=''
        urladress[0]=''
        @urlcomplet = "http://annuaire-des-mairies.com/" + urladress
        monhash = []
        monhash << [[@mailmairie], [@urlcomplet]]
        puts monhash
        get_the_email_of_a_townhall_from_its_webpage(@urlcomplet)

    end
end
get_all_the_urls_of_val_doise_townhalls
  

