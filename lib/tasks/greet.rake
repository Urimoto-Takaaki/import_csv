namespace :greet do
    # タスクの説明 desc => description（説明）
  desc "Helloを表示するタスク"
  # task_name => タスクの名前
  task say_hello: :environment do
    # 実行したい処理を記述する場所
    puts "Hello!!"
  end
end
