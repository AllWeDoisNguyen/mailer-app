Resque.redis = 'localhost:6379'

Resque.after_fork = Proc.new {
  ActiveRecord::Base.establish_connection
}

Resque.logger = Logger.new STDOUT
Resque.logger.level = Logger::DEBUG