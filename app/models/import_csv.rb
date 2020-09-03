class ImportCsv < ApplicationRecord
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
     CSV.foreach(path, headers: true) do |row|
       User.create(
         name: row["name"],
         age: row["age"],
         address: row["address"]
       )
     end
  end
end