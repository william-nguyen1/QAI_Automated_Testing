require_relative 'base_page'

module QAI
  class SiteContents < QAI::BasePage

    def check_page_is_site_contents_page
      expect($browser.find_element(:id, "pageTitle").text).should == "Site Contents"
    end

    #site contents when selecting the settings menu link on the home page
    def click_on_footer_links
      $browser.find_element(:id, "viewlist6ddee3e8-264d-45ca-94b8-f983e4e3515e").click
    end

    def click_create_new_subsite
      $browser.find_element(:id, "createnewsite").click
    end

    def create_sub_site_form (title_field, description_field, website_url)
      enter_text(:id, "ctl00_PlaceHolderMain_idTitleDescSection_ctl01_TxtCreateSubwebTitle", title_field)
      enter_text(:id, "ctl00_PlaceHolderMain_idTitleDescSection_ctl02_TxtCreateSubwebDescription", description_field)
      enter_text(:id, "ctl00_PlaceHolderMain_idUrlSection_ctl01_TxtCreateSubwebName", website_url)
      $browser.find_element(:id, "ctl00_PlaceHolderMain_ctl00_RptControls_BtnCreateSubweb").click
    end

    #sitecontents -new sharepoint site (new landing page)form
    # title field
  #  $browser.find_element(:id, "ctl00_PlaceHolderMain_idTitleDescSection_ctl01_TxtCreateSubwebTitle").clear
  #  $browser.find_element(:id, "ctl00_PlaceHolderMain_idTitleDescSection_ctl01_TxtCreateSubwebTitle").send_keys "Newsubsite"

    #description field
  #  $browser.find_element(:id, "ctl00_PlaceHolderMain_idTitleDescSection_ctl02_TxtCreateSubwebDescription").clear
#$browser.find_element(:id, "ctl00_PlaceHolderMain_idTitleDescSection_ctl02_TxtCreateSubwebDescription").send_keys "Text description"
#url name field
#$browser.find_element(:id, "ctl00_PlaceHolderMain_idUrlSection_ctl01_TxtCreateSubwebName").clear
#$browser.find_element(:id, "ctl00_PlaceHolderMain_idUrlSection_ctl01_TxtCreateSubwebName").send_keys "newsubsite"
#create button

  end
end
