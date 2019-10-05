require 'yaml'

def get_containers
  compose = YAML.load_file(__dir__ + '/../docker-compose.yml')

  compose['services'].delete 'sharemac.reverse-proxy'
  compose['services'].delete 'sharemac.phpmyadmin'

  compose['services'].each do |container, config|
    if config['labels'].nil? || config['labels'].empty? || config['labels'][0] === 'traefik.enable=false'
      compose['services'].delete container
    end
  end

  return compose['services']
end
