# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/show', type: :view do
  before(:each) do
    assign(:book, Book.create!(
                    name: 'Name',
                    description: 'MyText',
                    author: nil
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Author:\s*(None)?/)
  end
end
