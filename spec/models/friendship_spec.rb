
require 'rails_helper'
#class Friendship < ApplicationRecord
 # belongs_to :user
  #belongs_to :friend, class_name: 'User'
#end
RSpec.describe Friendship , type: :model do
  describe Friendship do
    it do
      should belong_to(:user)
      should belong_to(:friend).class_name('User')
    end

    it 'validations' do
      should validate_presence_of(:friend_id)
      should validate_presence_of(:user_id)
    end
  end
    
end