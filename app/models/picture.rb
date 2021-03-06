# == Schema Information
#
# Table name: pictures
#
#  id           :integer          not null, primary key
#  comment      :string
#  name         :string
#  content_type :string
#  data         :binary
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  musing_id    :integer
#

class Picture < ActiveRecord::Base

	#for musing
	belongs_to :musing, :class_name => 'Musing', :foreign_key => 'musing_id'

    validates :content_type, presence: true#, with: /^image/,  message: "must be a picture"
    validates :musing_id, presence: true
  def uploaded_picture=(picture_field)
     self.name = base_part_of(picture_field.original_filename)
     self.content_type = picture_field.content_type.chomp
     self.data = picture_field.read
  end
  def base_part_of(file_name)
      File.basename(file_name).gsub(/[^\w._-]/, '')
  end
end
