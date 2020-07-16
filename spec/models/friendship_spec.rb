require 'rails_helper'
RSpec.describe Friendship, type: :model do
  describe Friendship do
    it do
      should belong_to(:user)
      should belong_to(:friend).class_name('User')
    end
  end
end
