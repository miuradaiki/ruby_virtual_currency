require 'digest'

class Transaction
  attr_reader :sender, :recipient, :amount

  def initialize(sender, recipient, amount)
    @sender = sender
    @recipient = recipient
    @amount = amount
  end

  def to_hash
    Digest::SHA256.hexdigest("#{sender}#{recipient}#{amount}")
  end
end

class Block
  attr_reader :timestamp, :transactions, :previous_hash, :nonce, :hash

  def initialize(transactions, previous_hash)
    @timestamp = Time.now
    @transactions = transactions
    @previous_hash = previous_hash
    @nonce, @hash = compute_hash_with_proof_of_work
  end

  def compute_hash_with_proof_of_work(difficulty = '00')
    nonce = 0
    loop do
      hash = Digest::SHA256.hexdigest("#{timestamp}#{transactions}#{previous_hash}#{nonce}")
      if hash.start_with?(difficulty)
        return [nonce, hash]
      else
        nonce += 1
      end
    end
  end
end

class Blockchain
  attr_reader :chain

  def initialize
    @chain = [create_genesis_block]
  end

  def create_genesis_block
    Block.new("Genesis block", "0000000000000000000000000000000000000000000000000000000000000000")
  end

  def add_block(transactions)
    previous_hash = chain.last.hash
    block = Block.new(transactions, previous_hash)
    @chain << block
  end
end
