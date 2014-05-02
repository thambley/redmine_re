class Rating < ActiveRecord::Base
end

class ReRating < ActiveRecord::Base
end

class DeleteRatingsAndCreateReRatings < ActiveRecord::Migration

  
  def self.up
    
    create_table :re_ratings do |t|
      t.string :user_id
      t.string :re_artifact_properties_id
      t.integer :value
    end
    
    n = Rating.new
    if n.has_attribute?("re_artifact_properties_id")
      
      ratings = Rating.find(:all)
      ratings.each do |p|
        new_rating = ReRating.new
        new_rating.user_id = p.user_id
        new_rating.re_artifact_properties_id = p.re_artifact_properties_id
        new_rating.value = p.value
        new_rating.save
      end
      
      drop_table :ratings
    end
    n.destroy
    
  end

  def self.down
    drop_table :re_ratings
  end
end
