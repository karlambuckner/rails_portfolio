require 'rails_helper'

describe Skill, 'validation' do
  it { should validate_presence_of :skill }
end

describe Skill, 'association' do
  it { should belong_to :user }
end

describe Skill, 'column_specification' do
  it { should have_db_column(:skill) }
end
