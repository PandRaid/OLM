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
	end

	def fileform
		@message = "Hello, World!"
	end
end