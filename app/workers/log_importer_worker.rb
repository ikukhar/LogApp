class LogImporterWorker
  include Sidekiq::Worker

  def perform(*args)
    f = File.open("#{Rails.root}/log/main.log", "r")

    Log.bulk_insert do |worker|
      f.each_line do |line|
        begin
          data = JSON.parse(line)
          data["curr_user"] = data.delete("current_user")
        rescue
          next
        end
        worker.add(data)
      end
    end

    f.close
    # Для реального использования также необходимо дописать удаление перенесенных строк
    # из файла, чтобы они повторно не были загружены в базу.

    Log.reindex(resume: true)
  end
end
