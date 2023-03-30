# ruby_virtual_currency

# How to Use
- irbコマンドをターミナルで実行
- requireメソッドを使用して、virtual_currency.rbファイルを読み込む

`require './virtual_currency.rb'`

- Blockchainクラスのインスタンスを作成する

`blockchain = Blockchain.new`

- add_blockメソッドを使用して、新しいブロックを追加

```
blockchain.add_block([
  Transaction.new('Alice', 'Bob', 10),
  Transaction.new('Bob', 'Charlie', 5)
])
```

- chainメソッドを使用して、現在のブロックチェーンを表示

`blockchain.chain`
