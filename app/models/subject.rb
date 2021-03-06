class Subject < ActiveRecord::Base

  # Could delete related pages automatically
  # whenever a subject is deleted:
  # has_many :pages, :dependent => :destroy
  has_many :pages

  acts_as_list

  # Don't need to validate (in most cases):
  #   ids, foreign keys, timestamps, booleans, counters
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
    # validates_presence_of vs. validates_length_of :minimum => 1
    # different error messages: "can't be blank" or "is too short"
    # validates_length_of allows strings with only spaces!
  scope :visible, -> { where(visible:1) }
  scope :invisible, -> { where(visible:0) }
  scope :sorted, -> { order('subjects.name ASC')}
  scope :positioned, -> { order('subjects.position ASC')}
  scope :newest_first, -> {order('subjects.created_at ASC')}

  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }

end
