# frozen_string_literal: true

RSpec.describe Bookshelf::Actions::Books::Show do
  let(:books) { Hanami.app["database.rom"].relations[:books] }
  let(:params) { Hash[id: 1] }

  before do
    params[:id] = books.insert(title: "Test Driven Development", author: "Kent Beck")
  end

  it "works" do
    response = subject.call(params)
    expect(response).to be_successful
  end
end
