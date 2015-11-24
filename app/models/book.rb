class Book < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://placehold.it/300x200"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def pdf_attached?
    self.pdf.file?
  end

  # def readPDF()
  # 	io     = open('http://www.cbu.edu.zm/downloads/pdf-sample.pdf')
  #   reader = PDF::Reader.new(io)
  #   puts reader.info
  # end


  def self.random
    Book.offset(rand(Book.count)).first
  end
end
