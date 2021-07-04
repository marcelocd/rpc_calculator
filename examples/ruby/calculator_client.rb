this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'calculator_services_pb'

def main
  n1 = ARGV.size > 0 ?  ARGV[0].to_i : 1
  operator = ARGV.size > 1 ?  ARGV[1] : '+'
  n2 = ARGV.size > 2 ?  ARGV[2].to_i : 1
  hostname = ARGV.size > 3 ?  ARGV[3] : 'localhost:50051'

  stub = Calculator::Calculator::Stub.new(hostname, :this_channel_is_insecure)
  begin
    message = {
      '+': -> { stub.add(Calculator::AddRequest.new(n1: n1, n2: n2)).message },
      '-': -> { stub.subtract(Calculator::SubtractRequest.new(n1: n1, n2: n2)).message },
      '*': -> { stub.multiply(Calculator::MultiplyRequest.new(n1: n1, n2: n2)).message },
      '/': -> { stub.divide(Calculator::DivideRequest.new(n1: n1, n2: n2)).message }
    }[operator.to_sym].call
    puts "#{n1} #{operator} #{n2} = #{message}"
  rescue GRPC::BadStatus => e
    abort "ERROR: #{e.message}"
  end
end

main
