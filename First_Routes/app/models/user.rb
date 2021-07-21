class User < ApplicationRecord
    validates :name, :email, presence: true
    # validates :email, presence: true
    
    
end