class UploadController < ApplicationController
	def pdfview
		@message = "View the PDF"
	end

	def fileupload
		uploaded_io = params[:book]
		uploaded_io2 = params[:cover]
		File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb+') do |file|
			file.write(uploaded_io.read)
		end
		File.open(Rails.root.join('public', 'uploads', uploaded_io2.original_filename), 'wb+') do |file|
			file.write(uploaded_io.read)
		end

		book_params = {
			:title => params[:title],
			:author => params[:author],
			:book => params[:book].original_filename,
			:cover => params[:cover].original_filename,
		}

		book = Book.new(book_params)

		if book.save
			flash[:notice] = "Sucessfully uploaded book."
			redirect_to "/upload/fileform"
		else
			render "fileform"
		end
	end

	def fileform
		@message = "Hello, World!"
	end
end
