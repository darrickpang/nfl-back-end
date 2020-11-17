class User < ApplicationRecord
    has_secure_password
    has_secure_password :recovery_password, validations: false

    validates :name, uniqueness: true
    validates :name, :age, presence: true
    validate :adult_age 

    def adult_age
        if age < 18
            errors.add(:age, 'You need to be 18 before you can sign up.')
        end
    end
end
