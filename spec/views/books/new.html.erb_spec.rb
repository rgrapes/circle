# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/new', type: :view do
  before(:each) do
    assign(:book, Book.new(
                    name: 'MyString',
                    description: 'MyText',
                    author: nil
                  ))
  end

  it 'renders new book form' do
    render

    assert_select 'form[action=?][method=?]', books_path, 'post' do
      assert_select 'input[name=?]', 'book[name]'

      assert_select 'textarea[name=?]', 'book[description]'

      assert_select 'select[name=?]', 'book[author_id]'
    end
  end
end
