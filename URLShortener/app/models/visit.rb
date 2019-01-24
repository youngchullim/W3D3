# == Schema Information
#
# Table name: visits
#
#  id         :bigint(8)        not null, primary key
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visit < ApplicationRecord
  validates :short_url, :user_id, presence: true 

  
  
end
