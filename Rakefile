IMAGE_NAME = "my-cedar-app"

task :default => :run_server

task :run_server do
	stop_command
	build_command
	shell_command %Q|bundle exec ". ./env; rackup --host 0.0.0.0 --port 9291"|
end

task :run_job do
	stop_command
	build_command
	shell_command %Q|bundle exec ". ./env; ruby app.rb"|
end

task :build do
	build_command
end

task :stop do
	stop_command
end

task :shell do
	sh %Q|docker run -it -v "#{Dir.pwd}":/app/src #{IMAGE_NAME} bash|
end

task :restart do
	restart_command
end


def build_command
	# Build Docker container
	sh %Q|docker build -t #{IMAGE_NAME} .|

	# Bundle Install with Gemfile
	shell_command('bundle install --path ./bundle --without production')
end

def restart_command
	sh %Q|docker-machine restart default|
	sh %Q|docker-machine env default|
end

def stop_command
	sh %Q|docker stop $(docker ps -a -q)|
	sh %Q|docker rm $(docker ps -a -q)|
end

def dns
    resolver = '/etc/resolv.conf'
    return "0.0.0.0" if !File.exist?(resolver)
    open(resolver).each_line do |line|
        if line.include?('nameserver')
            return line.split(' ')[1].chomp
        end
    end
end

def shell_command(cmd)
	sh %Q|docker run --dns #{dns} -it -v "#{Dir.pwd}":/app/src -p 9292:9291 #{IMAGE_NAME} #{cmd}|
end
