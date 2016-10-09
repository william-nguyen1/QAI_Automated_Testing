module QAI
  class BasePage

    #generic actions --------------------------------------------------------------------------

    def navigate_to_url(url)
      $browser.navigate.to url
    end

    def enter_text(css_selector, css_class_name, text)
      $browser.find_element(css_selector, css_class_name).clear
      $browser.find_element(css_selector, css_class_name).send_keys text
    end

    def scroll_to_element(css_selector, css_class_name)
      header_element = $browser.find_elements(css_selector, css_class_name)
      header_element.location_once_scrolled_into_view
    end

    def check_for_text(css_selector, css_class_name, text)
      expect($browser.find_element(css_selector, css_class_name).text).to eql text
    end

    def check_for_value(css_selector, css_class_name, text)
      verify { ($browser.find_element(css_selector, css_class_name).attribute("value")).should == text }
      #if doesn't work try
      # expect($browser.find_element(css_selector, css_class_name).attribute("value")).should == text
    end

    def click_hyperlink(text)
      $browser.find_element(:link, text).click
    end

    def check_element_is_not_displayed(css_selector, css_class_name)
      expect($browser.find_element(css_selector, css_class_name).displayed?).to eql false
    end

    def switch_window(url, element)
      $browser.get url

      #gets the current window handle stores as a string
      original_window = $browser.window_handle
      $browser.find_element(css: element).click
      #get the window handles of all open browser windows stores as an array
      all_windows = $browser.window_handles
      #ruby hash? |this_window| operates as a for each
      new_window = all_windows.select { |this_window| this_window != first_window }

      $browser.switch_to.window(original_window)
      expect($browser.title).not_to eql 'New Window'

      $browser.switch_to.window(new_window)
      expect($browser.title).to eql 'New Window'
    end

    def check_web_page_title(pageTitle)
      expect($browser.title).to eql pageTitle
    end

    def current_url(expected_url)
      sleep 5
      current_URL = $browser.current_url

      if current_url != expected_url do
        raise "#{current_url} does not match the expected URL #{expected_url}"
      end

      expect($browser.current_url).to eql == "#{expected_url}"

    end

    def click_sign_in_link
      $browser.find_element(:link, "Sign in").click
    end

    def click_back_to_top_of_webpage_button
      $browser.find_element(:xpath, "(//button[@type='button'])[6]").click
    end

    def check_back_to_top_of_webpage_button_does_not_exist
      expect($browser.find_element(:xpath, "(//button[@type='button'])[6]").displayed?).to eql false
    end

    #settings -------------------------------------------------------------------------------
    #zz...id apparently changes
    def click_on_settings_cog
      $browser.get(@base_url + "/_layouts/15/viewlsts.aspx")
      $browser.find_element(:id, "zz12_SiteActionsMenu").click
    end

    def click_edit_page_menu_item
      $browser.find_element(:css, "#mp1_0_3_Anchor > #ctl00_ctl90_ctl02_SiteActionsMenuMain_ctl00_MenuItem_EditPage").click
    end

    def click_add_a_page_menu_item
      $browser.find_element(:css, "#ctl00_ctl90_ctl02_SiteActionsMenuMain_ctl00_wsaCreatePage > span.ms-core-menu-title").click
    end

    def click_site_contents_menu_item
      $browser.find_element(:css, "#zz13_MenuItem_ViewAllSiteContents > span.ms-core-menu-title").click
    #  $browser.find_element(:css, "#zz10_MenuItem_ViewAllSiteContents > span.ms-core-menu-title").click
    end

    def click_site_settings_menu_item
      $browser.find_element(:css, "#zz11_MenuItem_Settings > span.ms-core-menu-title").click
    end


  end
  end
end
