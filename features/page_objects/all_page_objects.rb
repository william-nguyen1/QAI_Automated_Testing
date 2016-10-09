# require all .rb files in the page_objects/qschools directory

current_path = File.expand_path('..', __FILE__)
$LOAD_PATH.unshift File.join(current_path, 'QAI')

Dir.glob(File.join(current_path, '**', '*.rb')).each do |f|
  require f
end
