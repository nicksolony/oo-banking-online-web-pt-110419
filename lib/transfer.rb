class Transfer
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
    if sender.valid?
      sender.balance -= @amount
      receiver.balance += @amount
      @status = 'complete'
      @amount = 0
    else
      'Transaction rejected. Please check your account balance.'
    end
    
  end
  
  
end
