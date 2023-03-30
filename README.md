# ruby_virtual_currency

# How to Use
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

# ブロックチェーンの内容の確認方法

`puts blockchain.chain.inspect`

# 各ブロックの内容の確認方法

```ruby
blockchain.chain.each do |block|
  puts "Block hash: #{block.hash}"
  puts "Previous hash: #{block.previous_hash}"
  puts "Transactions: #{block.transactions}"
  puts "Nonce: #{block.nonce}"
  puts "Timestamp: #{block.timestamp}"
end

```