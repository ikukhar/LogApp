class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :method
      t.string :path, :limit => 1000
      t.string :controller
      t.string :action
      t.integer :status
      t.datetime :action_time
      t.integer :curr_user
      t.string :browser_name
      t.string :browser_version
      t.text :browser_meta
      t.string :ip
      t.longtext :stacktrace
      t.longtext :error
      t.longtext :log
      t.string :os
      t.string :level
      t.string :device
      t.string :width
      t.string :height
      t.string :address

      t.timestamps
    end
  end
end
