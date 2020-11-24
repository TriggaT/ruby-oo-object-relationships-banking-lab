class Transfer

  attr_accessor :sender, :receiver, :status, :amount, :bank_account

  @@all = []

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender 
    @receiver = receiver
    @status = status
    @amount = amount
    @@all << self
  end 

  def valid?
    self.sender.valid? && 
    self.receiver.valid? 
  end

  def execute_transaction
    if self.valid? && @sender.balance >= amount && self.status != "complete"
      self.receiver.balance += amount
      self.sender.balance -= amount
      self.status = "complete"
    else  
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
     
    end 

  end 

  def reverse_transfer
    if self.status == "complete" 
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    end
  end 

  def all
    @@all
  end 
    
end
