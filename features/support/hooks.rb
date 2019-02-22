Dir[File.join(File.dirname(__FILE__), "spec_helper/*.rb")].sort.each { |file| require file }

$home_pages = Pages::HomePage::Home.new

World(Commons)

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/', '_')
  scenario.failed? ? print_screen(scenario_name.downcase!, 'falhou') : print_screen(scenario_name.downcase!, 'passou')
end
