class Comment < ApplicationRecord
  belongs_to :user    #userとのアソシーエション
  belongs_to :prototype  #prototypeとのアソシーエション
  validates :text, presence: true
end
