
  context 'callbacks' do
    it 'will not destory a category that is in use' do
      category = Category.create(:name => 'hard stuff')
      expense = category.expenses.create(:date => '1/1/2013', :description => 'expensive stuff', :amount => 10.49)
      category.destroy.should be_false
    end
  end


  
  before_destroy :check_for_expenses

  private

  def check_for_expenses
    expenses.empty?
  end