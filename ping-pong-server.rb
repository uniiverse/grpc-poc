this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'protos/ping_pong_services_pb'

require 'active_record'
require 'sqlite3'

ActiveRecord::Base.logger = Logger.new(STDERR)
# ActiveRecord::Base.colorize_logging = false

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "db/test.db"
)

# ActiveRecord::Schema.define do
#   create_table :codes do |table|
#     table.column :amount, :integer
#     table.column :name, :string
#   end
# end

class Code < ActiveRecord::Base
  validates :name, uniqueness: true
end

class PingPongServer < PingPong::Service
  def say_pong(req, _unused_call)
    name = req.sender_name
    PongReply.new(sender_name: name)
  end

  def say_ping(req, _unused_call)
    name = req.sender_name
    PingReply.new(sender_name: name)
  end

  def sum(req, _unused_call)
    NumberResponse.new(sum: req.numbers.sum)
  end

  def create_code(req, _unused_call)
    code = Code.new({
      name: req.name,
      amount: req.amount
    })
    if code.save
      CodeResponse.new(id: code.id, status: 'Saved!')
    else
      CodeResponse.new(id: nil, status: 'Failed!')
    end
  end

  def show_code(req, _unused_call)
    code = Code.find_by(name: req.name)
    if code.present?
      ShowCodeResponse.new(id: code.id, json: code.to_json)
    else
      raise GRPC::NotFound.new('Code was not found', {}, 'Debug string: Code was not found.')
    end
  end
end

def main
  puts "Launching gRPC server..."
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  s.handle(PingPongServer)
  puts "Server active and ready.."
  # Runs the server with SIGHUP, SIGINT and SIGTERM signal handlers to
  #   gracefully shutdown.
  # User could also choose to run server via call to run_till_terminated
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGTERM'])
end

main
