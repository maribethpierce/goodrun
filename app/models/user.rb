class User < ActiveRecord::Base
  belongs_to :research_group
  has_one :company
  # has_many :companies through: :research_groups
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true, if: :star?
  validates :gender, inclusion: { in: %w("male", "female") }
  validates :age, presence: true, if: :star?
  validates :birth_month, presence: true, if: :star?
  validates :birth_month, inclusion: { in: %w("January","February","March","April",
                                    "May","June","July","August","September","October",
                                    "November","December") }, if: :star?
  validates :relationship_status, presence: true, if: :star?
  validates :relationship_status, inclusion: { in: %w("Single","Long-Term Relationship",
                                            "Married","Separated","Divorced",
                                            "Widowed") }, if: :star?
  validates :race, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, if: :star?
  validates :anual_income, presence: true, if: :star?
  validates :anual_income, inclusion: { in: %w("Under $30,000","$30,000-$49,999","$50,000-$74,999",
                                      "$75,000-$99,000","$100,000+") }
  validates :children, presence: true, if: :star?
  validates :children, inclusion: { in: %w("0","1","2","3","4","5","6+") }
  validates :kid_ages, numericality: true, presence: true, if: :children?
  validates :twins, inclusion: { in: %w(true,false)}
  validates :twin_ages, numericality: true
  validates :education, presence: true, if: :star?
  validates :education, inclusion: { in: %w("Some High School","High School Graduate",
                                    "Some College","2-Year College Graduate",
                                    "4-Year College Graduate","Post Graduate Degree") }
  validates :career, presence: true, if: :star?
  validates :career, length: { maximum: 30, too_long: "%{count} characters is the maximum allowed" }
  validates :employer, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
  validates :phone, presence: true, if: :star?
  validates :phone, numericality: true
  validates :alt_phone, presence: true, if: :star?
  validates :alt_phone, numericality: true
  validates :zip, presence: true, if: :star?
  validates :zip, numericality: { only_integer: true }, length: { is: 5 }
  validates :closest_city, presence: true, if: :star?
  validates :closest_city, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :referral, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  def admin?
    admin
  end

  def company_user?
    company_user
  end

  def children?
    children.length > 0 && children[0] != "0"
  end

  def star?
    star
  end

end
