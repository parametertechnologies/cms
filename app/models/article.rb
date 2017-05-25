class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}

  def self.highlighted
    ## add logic to determine the highlighted article for the day..
    find_by title: 'Fiona is great!'
  end

end
