require __dir__ + '/get-containers.rb'

get_containers().each do |container, config|
  puts container
end

