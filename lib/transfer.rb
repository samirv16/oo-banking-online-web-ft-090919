class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end 
  
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.amount -= @sender.balance
      @receiver.amount += @receiver.balance
      
    else 
      @status = "rejected"
    end
  end
  
end
