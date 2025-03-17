# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/edit', type: :view do
  let(:book) do
    Book.create!(
      name: 'MyString',
      description: 'MyText',
      author: nil
    )
  end

  before(:each) do
    assign(:book, book)
  end

  it 'renders the edit book form' do
    render

    assert_select 'form[action=?][method=?]', book_path(book), 'post' do
      assert_select 'input[name=?]', 'book[name]'

      assert_select 'textarea[name=?]', 'book[description]'

      assert_select 'select[name=?]', 'book[author_id]'    end
  end
end
