class App < ActiveRecord::Base
    
    belongs_to :user
    
    # ensure that a user_id is present
    validates :user_id, presence: true
    
    #ensure that a name is present and having atleast 4 characters
    validates :name, length: { minimum: 4 }, presence: true
    
    #ensures that a version is present
    validates :version, presence: true
    
    paginates_per 25    
end
