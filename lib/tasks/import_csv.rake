require 'csv'

namespace :import_csv do
  desc "CSVデータをインポートするタスク"

task users: :environment do
    # インポートするファイルのパスを取得
    path = File.join Rails.root, "db/csv_data/csv_data.csv"
    # インポートするデータを格納するための配列
    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          age: row["age"],
          address: row["address"]
      }
    end
    puts "インポート処理を開始".red
    # インポートができなかった場合の例外処理
    begin
        User.transaction do
        # 例外が発生する可能性のある処理
        User.create!(list)
        end
      puts "インポート完了!!".green
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError".red
    end
  end

end
