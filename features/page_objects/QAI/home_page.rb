require_relative 'base_page'

module QAI
  class HomePage < QAI::BasePage

    def at_top_of_page
      ($browser.find_element(:id, "ctl00_ctl86_titleLink").text).should == "Moving Queensland Schools to NAPLAN Online"
    end




  end
end
