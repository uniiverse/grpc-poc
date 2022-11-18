this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'protos/ping_pong_services_pb'

def main
  hostname = ARGV.size > 1 ?  ARGV[1] : 'localhost:50051'
  stub = PingPong::Stub.new(hostname, :this_channel_is_insecure)
  begin
    # message = stub.say_pong(PingRequest.new)
    # p "Greeting1 #{message.class.name} from: #{message.sender_name}"

    # message2 = stub.say_ping(PongRequest.new(sender_name: 'Katie'))
    # p "Greeting2 #{message2.class.name} from: #{message2.sender_name}"

    # response = stub.sum(NumberCollection.new(numbers: [1,4,5,6,7]))
    # p "Numbers summed up by the server: #{response.sum}"

    # request = CreateCodeRequest.new(
    #   name: '20OFF',
    #   amount: 20_00
    # )
    # response = stub.create_code(request)
    # if response.id
    #   p "Code created: #{response.inspect}"
    # else
    #   p "Failed to save the code: #{response.inspect}"
    # end

    request = ShowCodeRequest.new(name: '20OFF')
    response = stub.show_code(request)
    p "Response: #{response.inspect}"
  rescue GRPC::NotFound => e
    p "Sorry couldn't find the code you were looking for. #{e}"
  rescue GRPC::BadStatus => e
    abort "ERROR: #{e.message}"
  end
end

main
