require 'rails_helper'

describe Project, 'validation' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :link }
end

describe Project, 'association' do
  it { should belong_to :user }
end

describe Project, 'column_specification' do
  it { should have_db_column(:name) }
  it { should have_db_column(:description) }
  it { should have_db_column(:link) }
end
