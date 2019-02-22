Dir[File.join(File.dirname(__FILE__), "pages/*.rb")].each {|file| require file}

module Pages
  module HomePage
    class Home
      def home_page
        Pages::Home.new
      end
    end
  end
end
