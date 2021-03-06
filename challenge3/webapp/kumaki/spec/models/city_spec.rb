# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { build(:city) }

  it '有効なファクトリを持つこと' do
    expect(city).to be_valid
  end
end
