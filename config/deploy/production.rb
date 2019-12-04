server '3.132.223.97', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/sa/.ssh/id_rsa'