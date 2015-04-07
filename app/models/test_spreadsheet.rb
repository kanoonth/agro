class TestSpreadsheet < ActiveRecord::Base
    ### Global var
    CONTENT_TYPE_STAGE1 = ContentType.find_by_name("ระยะกล้า")
    CONTENT_TYPE_STAGE2 = ContentType.find_by_name("ระยะแตกกอ")
    CONTENT_TYPE_STAGE3 = ContentType.find_by_name("ระยะออกรวง")
    CONTENT_TYPE_STAGE4 = ContentType.find_by_name("ระยะตั้งท้อง")
    CONTENT_TYPE_CURE = ContentType.find_by_name("การรักษา")
    CONTENT_TYPE_PROTECT = ContentType.find_by_name("การป้องกัน")
    
    array = Array.new
    array[0] = CONTENT_TYPE_STAGE1
    array[1] = CONTENT_TYPE_STAGE2
    array[2] = CONTENT_TYPE_STAGE3
    array[3] = CONTENT_TYPE_STAGE4
    array[4] = CONTENT_TYPE_CURE
    array[5] = CONTENT_TYPE_PROTECT
    ###

  def self.add_disease_content( row )
  	if(!(disease = Disease.find_by_name(row[1]))
  	  ret
    end

    for i in 0..5
      unless row[i+2].nil?
        Content.create(title: disease.name, body:row[i+2], content_type: array[i])
      end
    end

  end

  def self.read_content_to_record
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open 'spreadsheets/content.xlsx'
    content_sheet = book.worksheet( 0 )

    content_sheet.each 1 do |row|
    	add_disease_content(row)
    end
  end


end