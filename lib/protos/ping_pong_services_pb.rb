# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: protos/ping_pong.proto for package ''

require 'grpc'
require 'protos/ping_pong_pb'

module PingPong
  class Service

    include ::GRPC::GenericService

    self.marshal_class_method = :encode
    self.unmarshal_class_method = :decode
    self.service_name = 'PingPong'

    # rpc SayPong (PingRequest) returns (PongReply) {}
    # rpc SayPing (PongRequest) returns (PingReply) {}
    # rpc Sum (NumberCollection) returns (NumberResponse) {}
    rpc :CreateCode, ::CreateCodeRequest, ::CodeResponse
    rpc :ShowCode, ::ShowCodeRequest, ::ShowCodeResponse
  end

  Stub = Service.rpc_stub_class
end
