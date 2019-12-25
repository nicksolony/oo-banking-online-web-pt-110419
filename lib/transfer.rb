class Transfer
  
  require "pry"
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount =amount
    @status = 'pending'
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
   # binding.pry
    if valid? && sender.balance >= @amount && @status == 'pending'
      sender.balance -= @amount
      receiver.balance += @amount
      @status = 'complete'
    #  @amount = 0
    else
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end
  
  def reverse_transfer
      if @status == 'complete'
        sender.balance += @amount
        receiver.balance -= @amount
        @status = 'reversed'
      end
  end
  
end
