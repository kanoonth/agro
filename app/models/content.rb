require 'open-uri'

class Content < ActiveRecord::Base
  has_many :content_images
  belongs_to :content_type
  has_many :comments
  has_many :rates
  validates :title, presence: true
  validates :body, presence: true

  ### Global var

  content_type_stage1 = ContentType.find_by_name("ระยะกล้า")
  content_type_stage2 = ContentType.find_by_name("ระยะแตกกอ")
  content_type_stage3 = ContentType.find_by_name("ระยะออกรวง")
  content_type_stage4 = ContentType.find_by_name("ระยะตั้งท้อง")
  content_type_cure = ContentType.find_by_name("การรักษา")
  content_type_protect = ContentType.find_by_name("การป้องกัน")
  
  $array = Array.new
  $array[0] = content_type_stage1
  $array[1] = content_type_stage2
  $array[2] = content_type_stage3
  $array[3] = content_type_stage4
  $array[4] = content_type_cure
  $array[5] = content_type_protect

  ###

  def self.add_disease_content( content, image )
    disease = Disease.find_by_name(content[1])
  	if disease.nil?
  	  return
    end

    for j in 0..5
      unless content[j + 2].nil?
        c = Content.new(title: disease.name, body: content[j + 2], content_type: ContentType.find($array[j]), disease_id: disease.id)
        if image[j + 2]
          temp = open(image[j + 2])
          content_image = ContentImage.create!(image: temp)
          c.content_images << content_image
        end
        c.save!
      end
    end

  end

  def self.read_content_to_record
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open 'spreadsheets/content.xls'
    content_sheet = book.worksheet 0 
    image_sheet = book.worksheet 1

    (1...9).each do |i|
    	add_disease_content(content_sheet.row(i), image_sheet.row(i))
    end
  end

end
