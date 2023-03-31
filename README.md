# ruby_virtual_currency

## How to Use
- irbコマンドをターミナルで実行
- requireメソッドを使用して、virtual_currency.rbファイルを読み込む

`require './virtual_currency.rb'`

- Blockchainクラスのインスタンスを作成する

`blockchain = Blockchain.new`

- add_blockメソッドを使用して、新しいブロックを追加

```ruby
blockchain.add_block([
  Transaction.new('Alice', 'Bob', 10),
  Transaction.new('Bob', 'Charlie', 5)
])
```

- chainメソッドを使用して、現在のブロックチェーンを表示

`blockchain.chain`

## ブロックチェーンの内容の確認方法

`puts blockchain.chain.inspect`

## 各ブロックの内容の確認方法

これにより各ブロックのハッシュ値、前のブロックのハッシュ値、トランザクション、nonce値、およびタイムスタンプが出力される。

```ruby
blockchain.chain.each do |block|
  puts "Block hash: #{block.hash}"
  puts "Previous hash: #{block.previous_hash}"
  puts "Transactions: #{block.transactions}"
  puts "Nonce: #{block.nonce}"
  puts "Timestamp: #{block.timestamp}"
end

```

## 内容について
- Transaction、Block、およびBlockchainの3つのクラスを含む
  - Transactionクラスはトランザクションを表す
  - Blockクラスはブロックを表す
  - Blockchainクラスは複数のブロックを接続してブロックチェーンを形成する

- Blockクラスは`compute_hash_with_proof_of_work`メソッドを使用してブロックのハッシュ値を計算する
  - ブロックのnonce値を変更することによって、難易度に応じた条件を満たすハッシュ値を見つけるためのプルーフ・オブ・ワーク（PoW）アルゴリズムを実装

- Blockchainクラスは新しいトランザクションを含むブロックを追加するためのadd_blockメソッドを提供する
  - 前のブロックのハッシュ値を使用して、新しいブロックのハッシュ値を計算する


# English ver.
## How to Use
- Open the terminal and run the irb command.
Use the require method to load the virtual_currency.rb file.
`require './virtual_currency.rb'`

- Create an instance of the Blockchain class.
`blockchain = Blockchain.new`

- Use the add_block method to add a new block to the blockchain.

```ruby
blockchain.add_block([
  Transaction.new('Alice', 'Bob', 10),
  Transaction.new('Bob', 'Charlie', 5)
])
```

- Use the chain method to display the current blockchain.
`blockchain.chain`

## How to Check the Contents of the Blockchain
`puts blockchain.chain.inspect`

## How to Check the Contents of Each Block
This will output the hash value of each block, the previous block's hash value, transactions, nonce value, and timestamp.

```ruby
blockchain.chain.each do |block|
  puts "Block hash: #{block.hash}"
  puts "Previous hash: #{block.previous_hash}"
  puts "Transactions: #{block.transactions}"
  puts "Nonce: #{block.nonce}"
  puts "Timestamp: #{block.timestamp}"
end
```

## About the Content
- Contains three classes: Transaction, Block, and Blockchain.
  - The Transaction class represents a transaction.
  - The Block class represents a block.
  - The Blockchain class connects multiple blocks to form a blockchain.

- The Block class uses the compute_hash_with_proof_of_work method to compute the hash value of the block.
  - Implements a proof-of-work (PoW) algorithm to find a hash value that meets the conditions based on the difficulty by changing the nonce value of the block.

- The Blockchain class provides an add_block method to add a new block containing a new transaction.
  - Uses the hash value of the previous block to compute the hash value of the new block.
