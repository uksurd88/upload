class Picture < ActiveRecord::Base
def uploaded_picture=(picture_field)
 	self.name=base_part_of(picture_field.original_filename)
 	self.content_type=picture_field.content_type.chomp
 	self.data=picture_field.read
 end
 # File.basename returns the last component of the filename given in file_name, which must be formed using forward slashes (``/’’) regardless of the separator used on the local file system. If suffix is given and present at the end of file_name, it is removed. 
 	def base_part_of(file_name)
 		File.basename(file_name).gsub(/[^\w._-]/,'')
 	end
end
