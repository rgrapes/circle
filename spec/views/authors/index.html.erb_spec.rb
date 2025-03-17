# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'authors/index', type: :view do
  before(:each) do
    assign(:authors, [
             Author.create!(
               name: 'Name',
               bio: 'MyText'
             ),
             Author.create!(
               name: 'Name',
               bio: 'MyText'
             )
           ])
  end

  it 'renders a list of authors' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new('Name'), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'), count: 2
  end
end
