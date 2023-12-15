class Wiseuser < ApplicationRecord
    
    has_secure_password

    has_many :expenses

    validates :first_name, :last_name, :email, :uuid, presence: true
    validates :uuid, :email, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    # validates :password

    before_validation :set_new_uuid, on: :create

    private

    def set_defaults
        self.remember_token ||= SecureRandom.urlsafe_base64
    end

    def set_new_uuid
        # do while (until unique uuid is not found)
        begin
            new_uuid = SecureRandom.uuid
        end while Wiseuser.find_by_uuid(new_uuid).present?

        self.uuid = new_uuid
    end

end
