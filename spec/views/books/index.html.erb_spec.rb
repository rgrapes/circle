# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/index', type: :view do
  before(:each) do
    assign(:books, [
             Book.create!(
               name: 'Name',
               description: 'Description',
               author: nil
             ),
             Book.create!(
               name: 'Name',
               description: 'Description',
               author: nil
             )
           ])
  end

  it 'renders a list of books' do
    render
    
    assert_select 'div.book-item', text: /Name/, count: 2
    assert_select 'div.book-item', text: /Description/, count: 2
  end
end
