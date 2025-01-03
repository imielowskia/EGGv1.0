class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :egzams
  has_many :questions, through: :egzams
  require 'csv'
  after_update_commit -> { broadcast_replace_to 'users' }
  after_update_commit -> { broadcast_replace_to 'users', target: 'pobrane', partial: 'users/pobrane'}

  def self.import(file)

    CSV.foreach(file.path, headers: true) do |row|
      @u = User.new
      @u.attributes = row.to_hash
      @u.password_digest = ::BCrypt::Password.create(@u.password_digest)
      #@u.password = @u.encrypted_password
      @u.save(validate: false)
    end
  end

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  private

  def broadcast_pobral_update
    broadcast_replace_to 'users', target: "user_#{id}", partial: 'users/user', locals: { user: self }
  end
end
