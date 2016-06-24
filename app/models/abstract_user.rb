class AbstractUser < ActiveRecord::Base
  belongs_to :tribe
	self.inheritance_column = :type

  validates :type, presence: true

	scope :user, -> { where(type: 'User') }
	scope :admin, -> { where(type: 'Admin') }
	scope :operator, -> { where(type: 'Operator') }

	def talk
		raise 'Abstract Method'
	end

  class << self
    def types
      %w(User Admin Operator)
    end
  end
end
