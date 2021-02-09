# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PROVINCES = ['CABA', 'Buenos Aires','Córdoba', 'Mendoza', 'Salta', 'Santa Fe', 'Tucumán']

  validates :province, inclusion: { in: PROVINCES }
  validates :registration_number, length: { is: 6 }, presence: true
  validates :first_name, presence: true
  validates :first_name, length: { in: 2..20 }, allow_blank: true
  validates :last_name, presence: true
  validates :last_name, length: { in: 2..20 }, allow_blank: true

  has_many :cheques, dependent: :destroy

  validate :registration_number_uniqueness
    def national?
      province == 'CABA'
  end

  private

  def registration_number_uniqueness
    users = User.where(registration_number: registration_number)  # users con el mismo registration number
    # [User[registration_number: 1, province: "CABA"], User[registration_number: 1, province: "Cordoba"]]
    repetido = users.any? { |user| user.national? == national? }
    errors.add(:registration_number, "numero invalido") if repetido
  end
end
