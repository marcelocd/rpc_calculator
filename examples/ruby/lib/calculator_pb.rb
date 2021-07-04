# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: calculator.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("calculator.proto", :syntax => :proto3) do
    add_message "calculator.AddRequest" do
      optional :n1, :int64, 1
      optional :n2, :int64, 2
    end
    add_message "calculator.AddReply" do
      optional :message, :string, 1
    end
    add_message "calculator.SubtractRequest" do
      optional :n1, :int64, 1
      optional :n2, :int64, 2
    end
    add_message "calculator.SubtractReply" do
      optional :message, :string, 1
    end
    add_message "calculator.MultiplyRequest" do
      optional :n1, :int64, 1
      optional :n2, :int64, 2
    end
    add_message "calculator.MultiplyReply" do
      optional :message, :string, 1
    end
    add_message "calculator.DivideRequest" do
      optional :n1, :int64, 1
      optional :n2, :int64, 2
    end
    add_message "calculator.DivideReply" do
      optional :message, :string, 1
    end
  end
end

module Calculator
  AddRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("calculator.AddRequest").msgclass
  AddReply = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("calculator.AddReply").msgclass
  SubtractRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("calculator.SubtractRequest").msgclass
  SubtractReply = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("calculator.SubtractReply").msgclass
  MultiplyRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("calculator.MultiplyRequest").msgclass
  MultiplyReply = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("calculator.MultiplyReply").msgclass
  DivideRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("calculator.DivideRequest").msgclass
  DivideReply = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("calculator.DivideReply").msgclass
end