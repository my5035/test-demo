environment 'production'
threads 2, 32 # minimum 2 threads, maximum 64 threads
workers 2
#项目名
app_name = 'test-demo'
#项目路径
application_path = "/var/www/#{app_name}"
#这里一定要配置为项目路径下地current
directory "#{application_path}/current"

#下面都是 puma的配置项
pidfile "#{application_path}/tmp/pids/puma.pid"
#socket
state_path "#{application_path}/tmp/sockets/puma.state"
#log
stdout_redirect "#{application_path}/log/puma.stdout.log", "#{application_path}/log/puma.stderr.log"
#绑定sock
bind 'tcp://127.0.0.1:801'
# bind "unix://#{application_path}/tmp/sockets/#{app_name}.sock"

# activate_control_app "unix://#{application_path}/tmp/sockets/pumactl.sock"


worker_timeout 60

#后台运行
daemonize true

on_restart do
  puts 'On restart...'
end

# This is called everytime a worker is to be started.
on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

# This is called everytime a worker is to about to shutdown.
#
on_worker_shutdown do
  puts 'On worker shutdown...'
end

# This is called everytime a worker is to be started.

on_worker_fork do
  puts 'Before worker fork...'
end

preload_app!