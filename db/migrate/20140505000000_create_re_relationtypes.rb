class ReRelationtypes < ActiveRecord::Base
end

class ReArtifactProperties < ActiveRecord::Base
end


class CreateReRelationtypes < ActiveRecord::Migration
  def self.up
    
    create_table :re_relationtypes do |t|
      t.integer :project_id
      t.string :relation_type
      t.string :alias_name
      t.string :color
      t.integer :is_system_relation
      t.integer :is_directed
      t.integer :in_use
    end
    
    ReArtifactProperties.where(artifact_type: 'Project').each do |project|
      ReRelationtype.new(:project_id => project.project_id, :relation_type => "parentchild",   :alias_name => "Parent Child", :color => "#0000ff", :is_system_relation => "1", :is_directed => "1", :in_use => "1").save
      ReRelationtype.new(:project_id => project.project_id, :relation_type => "primary_actor", :alias_name => "Primary Actor", :color => "#ff99cc", :is_system_relation => "1", :is_directed => "1", :in_use => "1").save
      ReRelationtype.new(:project_id => project.project_id, :relation_type => "actors",        :alias_name => "Actors",  :color => "#ff00ff", :is_system_relation => "1", :is_directed => "1", :in_use => "1").save
      ReRelationtype.new(:project_id => project.project_id, :relation_type => "diagram",       :alias_name => "Diagram", :color => "#c0c0c0", :is_system_relation => "1", :is_directed => "1", :in_use => "1").save
      ReRelationtype.new(:project_id => project.project_id, :relation_type => "dependency",    :alias_name => "Dependency", :color => "#339966", :is_system_relation => "0", :is_directed => "1", :in_use => "1").save
      ReRelationtype.new(:project_id => project.project_id, :relation_type => "conflict",      :alias_name => "Conflict", :color => "#ff0000", :is_system_relation => "0", :is_directed => "0", :in_use => "1").save
      ReRelationtype.new(:project_id => project.project_id, :relation_type => "rationale",     :alias_name => "Rationale", :color => "#993300", :is_system_relation => "0", :is_directed => "1", :in_use => "1").save
      ReRelationtype.new(:project_id => project.project_id, :relation_type => "refinement",    :alias_name => "Refinement", :color => "#99cc00", :is_system_relation => "0", :is_directed => "1", :in_use => "1").save
      ReRelationtype.new(:project_id => project.project_id, :relation_type => "part_of",       :alias_name => "Part Of", :color => "#ffcc00", :is_system_relation => "0", :is_directed => "1", :in_use => "1").save
    end
      
  end

  def self.down
    drop_table :re_relationtypes
  end
end
