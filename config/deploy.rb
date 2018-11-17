set :application,       'battlehack'
set :repository,        '_site'
set :scm,               :none
set :deploy_via,        :copy
set :copy_compression,  :gzip
set :use_sudo,          false
set :host,              '10.9.185.31'

role :web,  host
role :app,  host
role :db,   host, :primary => true
ssh_options[:port] = 22

set :user,    'stack'
set :group,   user

set :deploy_to,    "/var/www/2013.battlehack.org/"

before 'deploy:update', 'deploy:update_jekyll'

namespace :deploy do

  [:start, :stop, :restart, :finalize_update].each do |t|
    desc "#{t} task is a no-op with jekyll"
    task t, :roles => :app do ; end
  end

  desc 'Run jekyll to update site before uploading'
  task :update_jekyll do
    %x(rm -rf _site/* && jekyll build)
  end

end