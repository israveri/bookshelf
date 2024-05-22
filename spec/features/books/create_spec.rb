# frozen_string_literal: true

require 'debug'

RSpec.feature "Creating books" do
  it "creates a book when given valid attributes" do
    visit "/books/new"

    fill_in "Title", with: "Dune"
    fill_in "Author", with: "Frank Herbert"
    click_on "Create"

    expect(page).to have_content "Book created"
    expect(page).to have_selector "h1", text: "Dune"
    expect(page).to have_selector "p", text: "Frank Herbert"
  end

  it "show errors and do not create the book when given invalid attributes" do
    visit "/books/new"

    fill_in "Title", with: "Dune"
    click_on "Create"

    expect(page).to have_content "Could not create book"
    expect(page).to have_field "Title", with: "Dune"
    expect(page).to have_field "Author", with: ""
  end
end
