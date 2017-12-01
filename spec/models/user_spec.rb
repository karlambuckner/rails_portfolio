require 'rails_helper'

describe User, 'validation' do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should validate_presence_of :password }
end

describe User, 'association' do
  it { should have_many :projects }
  it { should have_many :skills }
end

describe User, 'column_specification' do
  it { should have_db_column(:email) }
  it { should have_db_column(:encrypted_password) }
  it { should have_db_column(:sign_in_count) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }
  it { should have_db_column(:admin) }
end
