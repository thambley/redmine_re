class CreateReRatings < ActiveRecord::Migration
  
  def self.up
    create_table :re_ratings do |t|
      t.string :user_id
      t.string :re_artifact_properties_id
      t.integer :value
    end
  end

  def self.down
    drop_table :re_ratings
  end
  
end
