# frozen_string_literal: true

module Bookshelf
  module Views
    module Books
      class Index < Bookshelf::View
        include Deps["database.rom"]

        expose :books do |page:, per_page:|
          rom.relations[:books]
            .select(:id, :title, :author)
            .order(:title)
            .page(page)
            .per_page(per_page)
            .to_a
        end
      end
    end
  end
end
