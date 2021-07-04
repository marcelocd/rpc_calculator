this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'calculator_services_pb'

class CalculatorServer < Calculator::Calculator::Service
  def add(add_req, _unused_call)
    Calculator::AddReply.new(message: (add_req.n1 + add_req.n2).to_s)
  end

  def subtract(subtract_req, _unused_call)
    Calculator::SubtractReply.new(message: (subtract_req.n1 - subtract_req.n2).to_s)
  end

  def multiply(multiply_req, _unused_call)
    Calculator::MultiplyReply.new(message: (multiply_req.n1 * multiply_req.n2).to_s)
  end

  def divide(divide_req, _unused_call)
    Calculator::DivideReply.new(message: (divide_req.n1 / divide_req.n2).to_s)
  end
end

def main
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  s.handle(CalculatorServer)
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main
