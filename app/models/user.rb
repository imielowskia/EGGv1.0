class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :egzams
  has_many :questions, through: :egzams
  require 'csv'

  def self.import(file)

    CSV.foreach(file.path, headers: true) do |row|
      @u = User.new
      @u.attributes = row.to_hash
      @u.encrypted_password = ::BCrypt::Password.create(@u.encrypted_password)
      #@u.password = @u.encrypted_password
      @u.save(validate: false)
    end
  end



  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
