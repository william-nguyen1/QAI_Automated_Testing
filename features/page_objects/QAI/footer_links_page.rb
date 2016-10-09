require_relative 'base_page'

module QAI
  class FooterLinks < QAI::BasePage

    def verify_footerlinks_page_is_displayed
      expect($browser.find_element(:css, "#DeltaPlaceHolderPageTitleInTitleArea > span > span").text).should == "Footer Links"
    end

    def click_on_new_item
      $browser.find_element(:id, "idHomePageNewItem-img").click
    end

    def check_for_current_footer_links
      expect($browser.find_element(:link, "Copyright").text).should == "Copyright"
      expect($browser.find_element(:link, "Disclaimer").text).should == "Disclaimer"
      expect($browser.find_element(:link, "Privacy").text).should == "Privacy"
    end

    #new footerlinks form
    def select_dropdown_option(option)
      $element = Selenium::WebDriver::Support::Select.new($browser.find_element(:id, "Z1FooterLinkTarget_f7d9b680-5c95-456a-893f-2c733ad576c2_$DropDownChoice"))
      $element.select_by(:text, option)
    end

    def check_value_in_footer_display_order_field
      expect($browser.find_element(:id, "Z1FooterDisplayLevel_ac1b2c53-a2cf-4b49-970c-db12951c80db_$IntegerField").attribute("value")).should == "1"
    end

    def click_save_button
      $browser.find_element(:id, "ctl00_ctl79_g_7deff5a2_d170_470a_a6ab_123a940d31e7_ctl00_toolBarTbl_RightRptControls_ctl00_ctl00_diidIOSaveItem").click
    end

    #added footer link
    def check_footer_link_exists(css_selector, css_class_name, footer_name)
      expect($browser.find_element(css_selector, css_class_name).text).should == footer_name
    end

    def click_footer_link(footer_name)
      $browser.find_element(:link, footer_name).click
    end

    #TODO check this function works to find pending status
    def check_for_approval_status(css_selector, css_class_name, approval_status)
      expect($browser.find_element(css_selector, css_class_name).text).should == approval_status
    end

    #approve/reject form
    def click_approve_reject_sharepoint_ribbon
      $browser.find_element(:xpath, "//a[@id='Ribbon.ListForm.Display.Manage.ApproveReject-Medium']/span[2]").click
    end

    def select_approved_radio_button
      $browser.find_element(:id, "ctl00_PlaceHolderMain_approveDescription_ctl01_RadioBtnApprovalStatus_0").click
    end

    def click_OK_button
      $browser.find_element(:id, "ctl00_PlaceHolderMain_ctl00_RptControls_BtnSubmit").click
    end

    def check_new_footer_link_is_approved
      ($browser.find_element(:xpath, "//tr[@id='0,12,0']/td[11]").text).should == "Approved"
    end

    #edit existing footerlinks
    def click_footer_links_menu
      $browser.find_element(:xpath, "(//img[@alt='Open Menu'])[15]").click
    end

    def click_edit_item_option
      $browser.find_element(:css, "#ID_EditItem > span.ms-core-menu-title").click
    end

    def click_delete_item_option
      $browser.find_element(:css, "#ID_DeleteItem > span.ms-core-menu-title").click
    end

    def check_for_deletion_confirmation_message
      close_alert_and_get_its_text().should =~ /^Are you sure you want to send the item\(s\) to the site Recycle Bin[\s\S]$/
    end

  end
end
