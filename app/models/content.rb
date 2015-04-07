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

  def self.add_disease_content( row )
  	if(! (disease = Disease.find_by_name(row[1])) )
  	  return
    end



    for i in 0..5
      unless row[i+2].nil?
        Content.create(title: disease.name, body:row[i+2], content_type: ContentType.find($array[i]))
      end
    end

  end

  def self.read_content_to_record
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open 'spreadsheets/content.xls'
    content_sheet = book.worksheet( 0 )

    content_sheet.each 1 do |row|
    	add_disease_content(row)
    end
  end



end
