1. Is there a way to set arguments on proto message declarations and set their default values?
  -> https://developers.google.com/protocol-buffers/docs/proto#optional
2. What is `_unused_call` in the server definition?
  When we inspected from console.
   ```
   #<GRPC::ActiveCall::SingleReqView:0x00007f9c4490ab90 @wrapped=#<GRPC::ActiveCall:0x00007f9c44920968 @call=#<GRPC::Core::Call:0x00007f9c44921340>, @deadline=1969-12-31 18:59:59 -0500, @marshal=#<Proc:0x00007f9c44920df0 /Users/jasdeep/.rvm/gems/ruby-2.7.0/gems/grpc-1.50.0-x86_64-darwin/src/ruby/lib/grpc/generic/rpc_desc.rb:35>, @unmarshal=#<Proc:0x00007f9c44920cd8 /Users/jasdeep/.rvm/gems/ruby-2.7.0/gems/grpc-1.50.0-x86_64-darwin/src/ruby/lib/grpc/generic/rpc_desc.rb:47>, @metadata_received=true, @metadata_sent=false, @op_notifier=nil, @metadata_to_send={}, @send_initial_md_mutex=#<Thread::Mutex:0x00007f9c44920918>, @output_stream_done=false, @input_stream_done=true, @call_finished=false, @call_finished_mu=#<Thread::Mutex:0x00007f9c449208c8>, @client_call_executed=false, @client_call_executed_mu=#<Thread::Mutex:0x00007f9c44920850>, @peer="ipv6:%5B::1%5D:58132", @peer_cert=nil>>
   ```

3. 
