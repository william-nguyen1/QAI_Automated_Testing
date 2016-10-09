require_relative 'base_page'

module QAI

    class AppPage < QAI::BasePage

        def home
          @home_page ||= QAI::HomePage.new
        end

        def site_contents
          @site_contents_page ||= QAI::SiteContents.new
        end

        def footer_links
          @footer_links_page ||= QAI::FooterLinks.new
        end


    end
end
