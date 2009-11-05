class ProjectKudos < ActiveRecord::Base
  validates_uniqueness_of :project_id, :scope => [:user_id]
end
