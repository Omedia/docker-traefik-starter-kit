require __dir__ + '/get-containers.rb'

hosts = []

get_containers().each do |container, config|
  config['labels'].join(';;').scan(/frontend.rule=host:(.+?)(;;|$)/i).each do |item|
    hosts.push item[0]
  end
end

puts hosts.join(' ')

