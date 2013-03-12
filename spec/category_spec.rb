require 'spec_helper'

describe Category do 
  context 'validations' do 
    it {should validate_presence_of :name}
    it {should validate_uniqueness_of :name}

    it 'checks to make sure a category name is an alphanumeric string no longer than 25 characters' do
      category = Category.create(:name => 'supercalifragilisticexpialidocious')
      category.valid?.should be_false
    end
  end

  context 'associations' do
    it {should belong_to :expense}

  end

  

end