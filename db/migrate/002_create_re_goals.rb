class CreateReGoals < ActiveRecord::Migration
  def self.up
    create_table :re_goals do |t|
    end
  end

  def self.down
    drop_table :re_goals
  end
end
