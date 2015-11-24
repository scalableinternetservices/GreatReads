# require 'rubygems'
# # require 'pdf-reader'
# require 'open-uri'

class Book < ActiveRecord::Base
	has_attached_file :pdf, styles: {thumbnail: "60x60#"}
  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # validates_attachment_content_type :document, content_type: "application/pdf"
  validates_attachment_content_type :pdf, :content_type => ['application/pdf'], :if => :pdf_attached?

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
