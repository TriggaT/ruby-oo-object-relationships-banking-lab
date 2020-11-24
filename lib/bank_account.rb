class BankAccount

    attr_accessor :balance, :status, :transfer
    attr_reader :name

    @@all = []



    def initialize(name, balance = 1000, status = "open")
        @name = name 
        @balance = balance 
        @status = status 
        @@all << self
    end
    
    def deposit(transfer)
        self.balance += transfer

    end 

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.status == "open" && self.balance != 0
            true
        else false
        end 
        
    end 

    def close_account
        self.status = "closed"

    end 

    def all
        @@all
    end 


end
