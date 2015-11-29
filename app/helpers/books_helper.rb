module BooksHelper
	def cache_key_for_book_row(book)
		"book-#{book.id}-#{book.updated_at}-#{book.comments.count}"
	end

	def cache_key_for_book_table
		"book-table-#{Book.maximum(:updated_at)}-#{Comment.maximum(:updated_at)}"
	end
end
