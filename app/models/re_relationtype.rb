class ReRelationtype < ActiveRecord::Base
  unloadable
  
  validates :id, :presence => true, :numericality => true
  validates :project_id, :presence => true, :numericality => true
  validates :relation_type, :presence => true
  validates :alias_name, :presence => true
  validates :color, :format => { :with => /^#\d{6}$/}
  validates :is_system_relation, :inclusion => { :in => [true, false] }
  validates :is_directed, :inclusion => { :in => [true, false] }
  validates :in_use, :inclusion => { :in => [true, false] }
  
  def self.relation_types (project_id, is_system_relation=nil)
    relation_types = []
    tmp = nil
    if is_system_relation == nil
      tmp = ReRelationtype.find_all_by_project_id(project_id)
    else
      tmp = ReRelationtype.find_all_by_project_id_and_is_system_relation(project_id, is_system_relation)
    end
    tmp.each do |relationtype|
        relation_types << relationtype.relation_type
    end
    logger.debug relation_types.inspect
    relation_types
  end
end