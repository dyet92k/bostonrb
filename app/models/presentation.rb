class Presentation < ActiveRecord::Base

  has_markup :description, :cache_html => true
  belongs_to :user

  def to_s
    title
  end

  def self.featured
    first :order => "rand()"
  end

  def presenter
    user || other_speakers
  end

  def self.latest
    first :order => 'updated_at desc'
  end

  def presenter
    user.twitter || other_speakers
  end

end
