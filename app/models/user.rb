class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :egzams
  has_many :questions, through: :egzams
  require 'csv'
  after_update_commit {aktualizuj}
  after_create_commit {aktualizuj}

  def self.import(file)

    CSV.foreach(file.path, headers: true) do |row|
      @u = User.new
      @u.attributes = row.to_hash
      @u.password_digest = ::BCrypt::Password.create(@u.password_digest)
      #@u.password = @u.encrypted_password
      @u.save(validate: false)
    end
  end

  def aktualizuj
    broadcast_replace_to 'lista', partial: 'import/users_table', locals: { users: User.all }
  end

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
