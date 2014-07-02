class CreateReArtifactProperties < ActiveRecord::Migration

  def self.up
    create_table :re_artifact_properties do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :responsible_id, :integer
      t.column :created_by, :integer, :default => 0
      t.column :updated_by, :integer, :default => 0

      t.references :artifact, :polymorphic => true

      t.column :project_id, :integer, :default => 0
      
      t.column :comments_count, :integer
      
      t.column :rating_average, :decimal, :default => 0, :precision => 6, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :re_artifact_properties
  end
end
