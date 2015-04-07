# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Region.create( name: "ภาคเหนือ" )
Region.create( name: "ภาคตะวันออก" )
Region.create( name: "ภาคตะวันออกเฉียงเหนือ" )
Region.create( name: "ภาคกลาง" )
Region.create( name: "ภาคใต้" )
Region.create( name: "ภาคตะวันตก" )
Stage.create( name: "ระยะกล้า", min_day: 0, max_day: 14 )
Stage.create( name: "ระยะแตกกอ", min_day: 15, max_day: 28 )
Stage.create( name: "ระยะออกรวง", min_day: 29, max_day: 39 )
Stage.create( name: "ระยะตั้งท้อง", min_day: 40, max_day: 999 )
Stage.create( name: "25วัน", min_day: 0, max_day: 25 )
Stage.create( name: "50วัน", min_day: 26, max_day: 50 )
Stage.create( name: "75วัน", min_day: 51, max_day: 75 )
Ecology.create( name: "นาน้ำฝน" ) 
Ecology.create( name: "นาชลประทาน" )
AreaType.create( name: "ที่ลุ่น" )
AreaType.create( name: "ที่ดอน" )
Plantation.create( name: "ปักดำ" )
Plantation.create( name: "หว่าน" )
Plantation.create( name: "หยอด" )
SoilType.create( name: "ดินเหนียว" )
SoilType.create( name: "ดินร่วน" )
SoilType.create( name: "ดินทราย" )
ContentType.create( name: 'ระยะกล้า' )
ContentType.create( name: "ระยะแตกกอ" )
ContentType.create( name: "ระยะออกรวง" )
ContentType.create( name: "ระยะตั้งท้อง" )
ContentType.create( name: "การรักษา" )
ContentType.create( name: "การป้องกัน" )


### Dump Content for testing.
# ContentType.create( name: "rice")
# ContentImage.create( title: "ggggg" )
# content = Content.new( title: "aslkdskdf", body: "klasjfsaf")
# content.content_type = ContentType.last
# content.content_images << ContentImage.last
# content.save

rate = Rate.new( score: 5 )
rate.content = Content.last
rate.user = User.last
rate.save

comment = Comment.new( text: "comment yayyyyyyy")
comment.content = Content.last
comment.user = User.last
comment.save


Disease.read_disease_to_record

Content.read_content_to_record











#################################################################################

# ##### Disease
# a = Disease.new(name: "โรคใบไหม้")

# ##### DiseaseName
# # a.disease_names << DiseaseName.new(name: "Left Blight_B")
# # a.disease_names << DiseaseName.new(name: "Left Blight_C")

# a.save

# ##### Stage
# b = StageCertaintyFactor.new( cf: 0.75 )
# b.disease = a
# b.stage = Stage.where(name: "ระยะกล้า" ).first
# b.save

# c = StageCertaintyFactor.new( cf: 0.75 )
# c.disease = a
# c.stage = Stage.where(name: "ระยะแตกกอ" ).first
# c.save

# d = StageCertaintyFactor.new( cf: 0.5 )
# d.disease = a
# d.stage = Stage.where(name: "ระยะออกรวง" ).first
# d.save

# e = StageCertaintyFactor.new( cf: 0.25 )
# e.disease = a
# e.stage = Stage.where(name: "ระยะตั้งท้อง" ).first
# e.save

# ##### Nutrient
# f = Nitrogen.new(min: 28, max: 0, cf: 0.5)
# f.disease = a
# f.stage = Stage.where(name: "ระยะแตกกอ").first
# f.save

# g = Phosphoru.new(min: 8, max: 0, cf: 0.5)
# g.disease = a
# g.stage = Stage.where(name: "25วัน").first
# g.save

# h = Phosphoru.new(min: 2.6, max: 0, cf: 0.5)
# h.disease = a
# h.stage = Stage.where(name: "50วัน").first
# h.save

# i = Phosphoru.new(min: 3.6, max: 0, cf: 0.5)
# i.disease = a
# i.stage = Stage.where(name: "75วัน").first
# i.save

# # hi = Phosphoru.new(min: 0, max: 0.3, cf: 0.5)
# # hi.disease = a
# # hi.stage = Stage.where(name: "ระยะแตกกอ").first
# # hi.save

# j = Potassium.new(min: 42, max: 0, cf: 0.5)
# j.disease = a
# j.stage = Stage.where(name: "25วัน").first
# j.save

# k = Potassium.new(min: 40, max: 0, cf: 0.5)
# k.disease = a
# k.stage = Stage.where(name: "50วัน").first
# k.save

# l = Potassium.new(min: 36, max: 0, cf: 0.5)
# l.disease = a
# l.stage = Stage.where(name: "75วัน").first
# l.save

# ##### Region
# m = RegionCertaintyFactor.new(cf: 0.75)
# m.disease = a
# m.region = Region.where(name: "ภาคเหนือ").first
# m.save

# n = RegionCertaintyFactor.new(cf: 0.5)
# n.disease = a
# n.region = Region.where(name: "ภาคตะวันออก").first
# n.save

# o = RegionCertaintyFactor.new(cf: 0.75)
# o.disease = a
# o.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# o.save

# p = RegionCertaintyFactor.new(cf: 0.5)
# p.disease = a
# p.region = Region.where(name: "ภาคกลาง").first
# p.save

# q = RegionCertaintyFactor.new(cf: 0.75)
# q.disease = a
# q.region = Region.where(name: "ภาคใต้").first
# q.save

# r = RegionCertaintyFactor.new(cf: 0.75)
# r.disease = a
# r.region = Region.where(name: "ภาคตะวันตก").first
# r.save

# ##### Plantation
# s = PlantationCertaintyFactor.new( cf: 0.25 )
# s.disease = a
# s.plantation = Plantation.where(name: "ปักดำ").first
# s.save

# t = PlantationCertaintyFactor.new( cf: 0.75 )
# t.disease = a
# t.plantation = Plantation.where(name: "หว่าน").first
# t.save

# u = PlantationCertaintyFactor.new( cf: 0.25 )
# u.disease = a
# u.plantation = Plantation.where(name: "หยอด").first
# u.save

# ##### Ecology
# v = EcologyCertaintyFactor.new( cf: 0.75 )
# v.disease = a
# v.ecology = Ecology.where(name: "นาน้ำฝน").first
# v.save

# w = EcologyCertaintyFactor.new( cf: 0.25 )
# w.disease = a
# w.ecology = Ecology.where(name: "นาชลประทาน").first
# w.save

# ##### Area_type
# # x = AreaTypeCertaintyFactor.new( cf: 0.25 )
# # x.disease = a
# # x.area_type = AreaType.where(name: "AreaType_A").first
# # x.save

# # y = AreaTypeCertaintyFactor.new( cf: 0.25 )
# # y.disease = a
# # y.area_type = AreaType.where(name: "AreaType_B").first
# # y.save

# ##### Air
# aa = Temperature.new( min: 22, max: 28, cf: 0.75 )
# aa.disease = a
# aa.save

# bb = AirMoisture.new( min: 80, max: 100, cf: 0.75 )
# bb.disease = a
# bb.save

# cc = Wind.new( min: 0, max: 5, cf: 0.75 )
# cc.disease = a
# cc.save

# dd = SoilMoisture.new( min:0, max: 35, cf: 0.75 )
# dd.disease = a
# dd.save

# #################################################################################

# ##### Disease
# a = Disease.new(name: "โรคเมล็ดด่าง")

# ##### DiseaseName
# # a.disease_names << DiseaseName.new(name: "Dirty Panicle_B")
# # a.disease_names << DiseaseName.new(name: "Dirty Panicle_C")

# a.save

# ##### Stage
# b = StageCertaintyFactor.new( cf: 0 )
# b.disease = a
# b.stage = Stage.where(name: "ระยะกล้า" ).first
# b.save

# c = StageCertaintyFactor.new( cf: 0 )
# c.disease = a
# c.stage = Stage.where(name: "ระยะแตกกอ" ).first
# c.save

# d = StageCertaintyFactor.new( cf: 0.75 )
# d.disease = a
# d.stage = Stage.where(name: "ระยะออกรวง" ).first
# d.save

# e = StageCertaintyFactor.new( cf: 0.25 )
# e.disease = a
# e.stage = Stage.where(name: "ระยะตั้งท้อง" ).first
# e.save

# ##### Region
# m = RegionCertaintyFactor.new(cf: 0.75)
# m.disease = a
# m.region = Region.where(name: "ภาคเหนือ").first
# m.save

# n = RegionCertaintyFactor.new(cf: 0.5)
# n.disease = a
# n.region = Region.where(name: "ภาคตะวันออก").first
# n.save

# o = RegionCertaintyFactor.new(cf: 0.75)
# o.disease = a
# o.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# o.save

# p = RegionCertaintyFactor.new(cf: 0.75)
# p.disease = a
# p.region = Region.where(name: "ภาคกลาง").first
# p.save

# q = RegionCertaintyFactor.new(cf: 0.75)
# q.disease = a
# q.region = Region.where(name: "ภาคใต้").first
# q.save

# r = RegionCertaintyFactor.new(cf: 0.75)
# r.disease = a
# r.region = Region.where(name: "ภาคตะวันตก").first
# r.save

# ##### Ecology
# v = EcologyCertaintyFactor.new( cf: 0.25 )
# v.disease = a
# v.ecology = Ecology.where(name: "นาน้ำฝน").first
# v.save

# w = EcologyCertaintyFactor.new( cf: 0.75 )
# w.disease = a
# w.ecology = Ecology.where(name: "นาชลประทาน").first
# w.save

# ##### Air
# aa = Temperature.new( min: 35, max: 40, cf: 0.75 )
# aa.disease = a
# aa.save

# cc = Wind.new( min: 29, max: 38, cf: 0.75 )
# cc.disease = a
# cc.save

# dd = Rain.new( min:35, max: 90, cf: 0.75 )
# dd.disease = a
# dd.save

# #################################################################################

# ##### Disease
# a = Disease.new(name: "โรคขอบใบแห้ง")

# ##### DiseaseName
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

# a.save

# ##### Stage
# b = StageCertaintyFactor.new( cf: 0.5 )
# b.disease = a
# b.stage = Stage.where(name: "ระยะกล้า" ).first
# b.save

# c = StageCertaintyFactor.new( cf: 0.75 )
# c.disease = a
# c.stage = Stage.where(name: "ระยะแตกกอ" ).first
# c.save

# d = StageCertaintyFactor.new( cf: 0.5 )
# d.disease = a
# d.stage = Stage.where(name: "ระยะออกรวง" ).first
# d.save

# e = StageCertaintyFactor.new( cf: 0 )
# e.disease = a
# e.stage = Stage.where(name: "ระยะตั้งท้อง" ).first
# e.save

# ##### Nutrient
# f = Nitrogen.new(min: 28, max: 0, cf: 0.5)
# f.disease = a
# f.stage = Stage.where(name: "ระยะแตกกอ").first
# f.save

# ##### Region
# m = RegionCertaintyFactor.new(cf: 0.75)
# m.disease = a
# m.region = Region.where(name: "ภาคเหนือ").first
# m.save

# n = RegionCertaintyFactor.new(cf: 0.5)
# n.disease = a
# n.region = Region.where(name: "ภาคตะวันออก").first
# n.save

# o = RegionCertaintyFactor.new(cf: 0.75)
# o.disease = a
# o.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# o.save

# p = RegionCertaintyFactor.new(cf: 0.5)
# p.disease = a
# p.region = Region.where(name: "ภาคกลาง").first
# p.save

# q = RegionCertaintyFactor.new(cf: 0.75)
# q.disease = a
# q.region = Region.where(name: "ภาคใต้").first
# q.save

# r = RegionCertaintyFactor.new(cf: 0.5)
# r.disease = a
# r.region = Region.where(name: "ภาคตะวันตก").first
# r.save

# ##### Ecology
# v = EcologyCertaintyFactor.new( cf: 0.75 )
# v.disease = a
# v.ecology = Ecology.where(name: "นาน้ำฝน").first
# v.save

# w = EcologyCertaintyFactor.new( cf: 0.75 )
# w.disease = a
# w.ecology = Ecology.where(name: "นาชลประทาน").first
# w.save

# ##### Air
# aa = Temperature.new( min: 25, max: 34, cf: 0.75 )
# aa.disease = a
# aa.save

# bb = AirMoisture.new( min: 70, max: 100, cf: 0.75 )
# bb.disease = a
# bb.save

# cc = Wind.new( min: 29, max: 38, cf: 0.75 )
# cc.disease = a
# cc.save

# dd = SoilMoisture.new( min:65, max: 100, cf: 0.75 )
# dd.disease = a
# dd.save

# ee = Rain.new( min:10, max: 35, cf: 0.75 )
# ee.disease = a
# ee.save

# #################################################################################

# ##### Disease
# a = Disease.new(name: "โรคใบจุดสีน้ำตาล")

# ##### DiseaseName
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

# a.save

# ##### Stage
# b = StageCertaintyFactor.new( cf: 0.5 )
# b.disease = a
# b.stage = Stage.where(name: "ระยะกล้า" ).first
# b.save

# c = StageCertaintyFactor.new( cf: 0.75 )
# c.disease = a
# c.stage = Stage.where(name: "ระยะแตกกอ" ).first
# c.save

# d = StageCertaintyFactor.new( cf: 0.5 )
# d.disease = a
# d.stage = Stage.where(name: "ระยะออกรวง" ).first
# d.save

# e = StageCertaintyFactor.new( cf: 0.25 )
# e.disease = a
# e.stage = Stage.where(name: "ระยะตั้งท้อง" ).first
# e.save

# ##### Nutrient
# f = Nitrogen.new(min: 0, max: 24, cf: 0.5)
# f.disease = a
# f.stage = Stage.where(name: "ระยะแตกกอ").first
# f.save

# g = Phosphoru.new(min: 0, max: 7, cf: 0.5)
# g.disease = a
# g.stage = Stage.where(name: "25วัน").first
# g.save

# h = Phosphoru.new(min: 0, max: 1.8, cf: 0.5)
# h.disease = a
# h.stage = Stage.where(name: "50วัน").first
# h.save

# i = Phosphoru.new(min: 0, max: 2.6, cf: 0.5)
# i.disease = a
# i.stage = Stage.where(name: "75วัน").first
# i.save

# hi = Phosphoru.new(min: 0, max: 0.3, cf: 0.5)
# hi.disease = a
# hi.stage = Stage.where(name: "ระยะแตกกอ").first
# hi.save

# j = Potassium.new(min: 0, max: 37, cf: 0.5)
# j.disease = a
# j.stage = Stage.where(name: "25วัน").first
# j.save

# k = Potassium.new(min: 0, max: 37, cf: 0.5)
# k.disease = a
# k.stage = Stage.where(name: "50วัน").first
# k.save

# l = Potassium.new(min: 0, max: 35, cf: 0.5)
# l.disease = a
# l.stage = Stage.where(name: "75วัน").first
# l.save

# ##### Region
# m = RegionCertaintyFactor.new(cf: 0.75)
# m.disease = a
# m.region = Region.where(name: "ภาคเหนือ").first
# m.save

# n = RegionCertaintyFactor.new(cf: 0.5)
# n.disease = a
# n.region = Region.where(name: "ภาคตะวันออก").first
# n.save

# o = RegionCertaintyFactor.new(cf: 0.75)
# o.disease = a
# o.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# o.save

# p = RegionCertaintyFactor.new(cf: 0.75)
# p.disease = a
# p.region = Region.where(name: "ภาคกลาง").first
# p.save

# q = RegionCertaintyFactor.new(cf: 0.75)
# q.disease = a
# q.region = Region.where(name: "ภาคใต้").first
# q.save

# r = RegionCertaintyFactor.new(cf: 0.75)
# r.disease = a
# r.region = Region.where(name: "ภาคตะวันตก").first
# r.save

# ##### Plantation
# s = PlantationCertaintyFactor.new( cf: 0.75 )
# s.disease = a
# s.plantation = Plantation.where(name: "ปักดำ").first
# s.save

# t = PlantationCertaintyFactor.new( cf: 0.75 )
# t.disease = a
# t.plantation = Plantation.where(name: "หว่าน").first
# t.save

# u = PlantationCertaintyFactor.new( cf: 0.75 )
# u.disease = a
# u.plantation = Plantation.where(name: "หยอด").first
# u.save

# ##### Ecology
# v = EcologyCertaintyFactor.new( cf: 0.75 )
# v.disease = a
# v.ecology = Ecology.where(name: "นาน้ำฝน").first
# v.save

# w = EcologyCertaintyFactor.new( cf: 0.75 )
# w.disease = a
# w.ecology = Ecology.where(name: "นาชลประทาน").first
# w.save

# ##### Air
# aa = Temperature.new( min: 16, max: 36, cf: 0.75 )
# aa.disease = a
# aa.save

# bb = AirMoisture.new( min: 86, max: 100, cf: 0.75 )
# bb.disease = a
# bb.save

# cc = Wind.new( min: 29, max: 38, cf: 0.75 )
# cc.disease = a
# cc.save

# #################################################################################

# ##### Disease
# a = Disease.new(name: "โรคถอดฝักดาบ")

# ##### DiseaseName
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

# a.save

# ##### Stage
# b = StageCertaintyFactor.new( cf: 0.5 )
# b.disease = a
# b.stage = Stage.where(name: "ระยะกล้า" ).first
# b.save

# c = StageCertaintyFactor.new( cf: 0.75 )
# c.disease = a
# c.stage = Stage.where(name: "ระยะแตกกอ" ).first
# c.save

# d = StageCertaintyFactor.new( cf: 0.25 )
# d.disease = a
# d.stage = Stage.where(name: "ระยะออกรวง" ).first
# d.save

# e = StageCertaintyFactor.new( cf: 0.25 )
# e.disease = a
# e.stage = Stage.where(name: "ระยะตั้งท้อง" ).first
# e.save

# ##### Region
# m = RegionCertaintyFactor.new(cf: 0.75)
# m.disease = a
# m.region = Region.where(name: "ภาคเหนือ").first
# m.save

# n = RegionCertaintyFactor.new(cf: 0.5)
# n.disease = a
# n.region = Region.where(name: "ภาคตะวันออก").first
# n.save

# o = RegionCertaintyFactor.new(cf: 0.75)
# o.disease = a
# o.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# o.save

# p = RegionCertaintyFactor.new(cf: 0.5)
# p.disease = a
# p.region = Region.where(name: "ภาคกลาง").first
# p.save

# q = RegionCertaintyFactor.new(cf: 0.75)
# q.disease = a
# q.region = Region.where(name: "ภาคใต้").first
# q.save

# r = RegionCertaintyFactor.new(cf: 0.75)
# r.disease = a
# r.region = Region.where(name: "ภาคตะวันตก").first
# r.save

# ##### Ecology
# v = EcologyCertaintyFactor.new( cf: 0.75 )
# v.disease = a
# v.ecology = Ecology.where(name: "นาน้ำฝน").first
# v.save

# #################################################################################

# ##### Disease
# a = Disease.new(name: "โรคใบขีดสีน้ำตาล")

# ##### DiseaseName
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

# a.save

# ##### Stage
# b = StageCertaintyFactor.new( cf: 0.25 )
# b.disease = a
# b.stage = Stage.where(name: "ระยะกล้า" ).first
# b.save

# c = StageCertaintyFactor.new( cf: 0.5 )
# c.disease = a
# c.stage = Stage.where(name: "ระยะแตกกอ" ).first
# c.save

# d = StageCertaintyFactor.new( cf: 0.75 )
# d.disease = a
# d.stage = Stage.where(name: "ระยะออกรวง" ).first
# d.save

# e = StageCertaintyFactor.new( cf: 0.75 )
# e.disease = a
# e.stage = Stage.where(name: "ระยะตั้งท้อง" ).first
# e.save

# ##### Nutrient
# j = Potassium.new(min: 0, max: 37, cf: 0.5)
# j.disease = a
# j.stage = Stage.where(name: "25วัน").first
# j.save

# k = Potassium.new(min: 0, max: 37, cf: 0.5)
# k.disease = a
# k.stage = Stage.where(name: "50วัน").first
# k.save

# l = Potassium.new(min: 0, max: 35, cf: 0.5)
# l.disease = a
# l.stage = Stage.where(name: "75วัน").first
# l.save

# ##### Region
# m = RegionCertaintyFactor.new(cf: 0.75)
# m.disease = a
# m.region = Region.where(name: "ภาคเหนือ").first
# m.save

# n = RegionCertaintyFactor.new(cf: 0.5)
# n.disease = a
# n.region = Region.where(name: "ภาคตะวันออก").first
# n.save

# o = RegionCertaintyFactor.new(cf: 0.75)
# o.disease = a
# o.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# o.save

# p = RegionCertaintyFactor.new(cf: 0.75)
# p.disease = a
# p.region = Region.where(name: "ภาคกลาง").first
# p.save

# q = RegionCertaintyFactor.new(cf: 0.75)
# q.disease = a
# q.region = Region.where(name: "ภาคใต้").first
# q.save

# r = RegionCertaintyFactor.new(cf: 0.75)
# r.disease = a
# r.region = Region.where(name: "ภาคตะวันตก").first
# r.save

# ##### Plantation
# s = PlantationCertaintyFactor.new( cf: 0.75 )
# s.disease = a
# s.plantation = Plantation.where(name: "ปักดำ").first
# s.save

# t = PlantationCertaintyFactor.new( cf: 0.75 )
# t.disease = a
# t.plantation = Plantation.where(name: "หว่าน").first
# t.save

# u = PlantationCertaintyFactor.new( cf: 0.75 )
# u.disease = a
# u.plantation = Plantation.where(name: "หยอด").first
# u.save

# ##### Ecology
# v = EcologyCertaintyFactor.new( cf: 0.75 )
# v.disease = a
# v.ecology = Ecology.where(name: "นาน้ำฝน").first
# v.save

# w = EcologyCertaintyFactor.new( cf: 0.75 )
# w.disease = a
# w.ecology = Ecology.where(name: "นาชลประทาน").first
# w.save

# ##### Air
# aa = Temperature.new( min: 16, max: 36, cf: 0.75 )
# aa.disease = a
# aa.save

# cc = Wind.new( min: 29, max: 38, cf: 0.75 )
# cc.disease = a
# cc.save

# #################################################################################

# ##### Disease
# a = Disease.new(name: "โรครากปม")

# ##### DiseaseName
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

# a.save

# ##### Stage
# b = StageCertaintyFactor.new( cf: 0.75 )
# b.disease = a
# b.stage = Stage.where(name: "ระยะกล้า" ).first
# b.save

# c = StageCertaintyFactor.new( cf: 0.5 )
# c.disease = a
# c.stage = Stage.where(name: "ระยะแตกกอ" ).first
# c.save

# d = StageCertaintyFactor.new( cf: 0 )
# d.disease = a
# d.stage = Stage.where(name: "ระยะออกรวง" ).first
# d.save

# e = StageCertaintyFactor.new( cf: 0 )
# e.disease = a
# e.stage = Stage.where(name: "ระยะตั้งท้อง" ).first
# e.save

# ##### Region
# m = RegionCertaintyFactor.new(cf: 0.75)
# m.disease = a
# m.region = Region.where(name: "ภาคเหนือ").first
# m.save

# n = RegionCertaintyFactor.new(cf: 0.5)
# n.disease = a
# n.region = Region.where(name: "ภาคตะวันออก").first
# n.save

# o = RegionCertaintyFactor.new(cf: 0.75)
# o.disease = a
# o.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# o.save

# p = RegionCertaintyFactor.new(cf: 0.5)
# p.disease = a
# p.region = Region.where(name: "ภาคกลาง").first
# p.save

# q = RegionCertaintyFactor.new(cf: 0.5)
# q.disease = a
# q.region = Region.where(name: "ภาคใต้").first
# q.save

# r = RegionCertaintyFactor.new(cf: 0.5)
# r.disease = a
# r.region = Region.where(name: "ภาคตะวันตก").first
# r.save

# ##### Plantation
# t = PlantationCertaintyFactor.new( cf: 0.75 )
# t.disease = a
# t.plantation = Plantation.where(name: "หว่าน").first
# t.save

# u = PlantationCertaintyFactor.new( cf: 0.75 )
# u.disease = a
# u.plantation = Plantation.where(name: "หยอด").first
# u.save

# ##### Ecology
# v = EcologyCertaintyFactor.new( cf: 0.75 )
# v.disease = a
# v.ecology = Ecology.where(name: "นาน้ำฝน").first
# v.save

# ##### AreaType
# x = AreaTypeCertaintyFactor.new( cf:0.75 )
# x.disease = a
# x.area_type = AreaType.where(name: "Upland").first
# x.save

# ##### Air
# bb = AirMoisture.new( min: 0, max: 35, cf: 0.75 )
# bb.disease = a
# bb.save

# cc = SoilMoisture.new( min: 0, max: 35, cf: 0.75 )
# cc.disease = a
# cc.save

# #################################################################################

# ##### Disease
# a = Disease.new(name: "โรคลำต้นเน่า")

# ##### DiseaseName
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# # a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

# a.save

# ##### Stage
# b = StageCertaintyFactor.new( cf: 0.25 )
# b.disease = a
# b.stage = Stage.where(name: "ระยะกล้า" ).first
# b.save

# c = StageCertaintyFactor.new( cf: 0.75 )
# c.disease = a
# c.stage = Stage.where(name: "ระยะแตกกอ" ).first
# c.save

# d = StageCertaintyFactor.new( cf: 0.75 )
# d.disease = a
# d.stage = Stage.where(name: "ระยะออกรวง" ).first
# d.save

# e = StageCertaintyFactor.new( cf: 0.5 )
# e.disease = a
# e.stage = Stage.where(name: "ระยะตั้งท้อง" ).first
# e.save

# ##### Nutrient
# f = Nitrogen.new(min: 28, max: 0, cf: 0.5)
# f.disease = a
# f.stage = Stage.where(name: "ระยะแตกกอ").first
# f.save

# ##### Region
# m = RegionCertaintyFactor.new(cf: 0.75)
# m.disease = a
# m.region = Region.where(name: "ภาคเหนือ").first
# m.save

# n = RegionCertaintyFactor.new(cf: 0.5)
# n.disease = a
# n.region = Region.where(name: "ภาคตะวันออก").first
# n.save

# o = RegionCertaintyFactor.new(cf: 0.75)
# o.disease = a
# o.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# o.save

# p = RegionCertaintyFactor.new(cf: 0.75)
# p.disease = a
# p.region = Region.where(name: "ภาคกลาง").first
# p.save

# q = RegionCertaintyFactor.new(cf: 0.75)
# q.disease = a
# q.region = Region.where(name: "ภาคใต้").first
# q.save

# r = RegionCertaintyFactor.new(cf: 0.5)
# r.disease = a
# r.region = Region.where(name: "ภาคตะวันตก").first
# r.save

# ##### Ecology
# v = EcologyCertaintyFactor.new( cf: 0.75 )
# v.disease = a
# v.ecology = Ecology.where(name: "นาน้ำฝน").first
# v.save

# w = EcologyCertaintyFactor.new( cf: 0.75 )
# w.disease = a
# w.ecology = Ecology.where(name: "นาชลประทาน").first
# w.save

# ##### SoilType
# # x = SoilTypeCertaintyFactor.new( cf: 0.75 )
# # x.disease = a
# # x.soil_type = SoilType.where(name: "Clay").first
# # x.save

# # y = SoilTypeCertaintyFactor.new( cf: 0.5 )
# # y.disease = a
# # y.soil_type = SoilType.where(name: "Mold").first
# # y.save

# # z = SoilTypeCertaintyFactor.new( cf: 0.75 )
# # z.disease = a
# # z.soil_type = SoilType.where(name: "Sandy").first
# # z.save

# ##### Air
# aa = Temperature.new( min: 30, max: 50, cf: 0.75 )
# aa.disease = a
# aa.save

# bb = AirMoisture.new( min: 0, max: 35, cf: 0.75 )
# bb.disease = a
# bb.save

# cc = SoilMoisture.new( min: 65, max: 100, cf: 0.75 )
# cc.disease = a
# cc.save

# ##################################################################
# prov = Province.new( name: "Bangkok")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Amnat Charoen")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Ang Thong")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Bueng Kan")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Buriram")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Chachoengsao")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Chainat")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Chaiyaphum")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Chanthaburi")
# prov.region = Region.where(name: "ภาคตะวันออก").first
# prov.save

# prov = Province.new( name: "Chiang Mai")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Chiang Rai")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Chonburi")
# prov.region = Region.where(name: "ภาคตะวันออก").first
# prov.save

# prov = Province.new( name: "Chumphon")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Kalasin")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Kamphaeng Phet")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Kanchanaburi")
# prov.region = Region.where(name: "ภาคตะวันตก").first
# prov.save

# prov = Province.new( name: "Khon Kaen")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Krabi")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Lampang")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Lamphun")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Loei")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Lopburi")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Mae Hong Son")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Maha Sarakham")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Mukdahan")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Nakhon Nayok")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Nakhon Pathom")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Nakhon Phanom")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Nakhon Ratchasima")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Nakhon Sawan")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Nakhon Si Thammarat")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Nan")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Narathiwat")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Nong Bua Lamphu")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Nong Khai")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Nonthaburi")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Pathum Thani")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Pattani")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Phang Nga")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Phatthalung")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Phayao")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Phetchabun")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Phetchaburi")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Phichit")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Phitsanulok")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Phra Nakhon Si Ayutthaya")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Phrae")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Phuket")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Prachinburi")
# prov.region = Region.where(name: "ภาคตะวันออก").first
# prov.save

# prov = Province.new( name: "Prachuap Khiri Khan")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Ranong")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Ratchaburi")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Rayong")
# prov.region = Region.where(name: "ภาคตะวันออก").first
# prov.save

# prov = Province.new( name: "Roi Et")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Sa Kaeo")
# prov.region = Region.where(name: "ภาคตะวันออก").first
# prov.save

# prov = Province.new( name: "Sakon Nakhon")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Samut Prakan")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Samut Sakhon")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Samut Songkhram")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Saraburi")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Satun")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Sing Buri")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Sisaket")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Songkhla")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Sukhothai")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Suphan Buri")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Surat Thani")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Surin")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Tak")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Trang")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Trat")
# prov.region = Region.where(name: "ภาคตะวันออก").first
# prov.save

# prov = Province.new( name: "Ubon Ratchathani")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Udon Thani")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# prov = Province.new( name: "Uthai Thani")
# prov.region = Region.where(name: "ภาคกลาง").first
# prov.save

# prov = Province.new( name: "Uttaradit")
# prov.region = Region.where(name: "ภาคเหนือ").first
# prov.save

# prov = Province.new( name: "Yala")
# prov.region = Region.where(name: "ภาคใต้").first
# prov.save

# prov = Province.new( name: "Yasothon")
# prov.region = Region.where(name: "ภาคตะวันออกเฉียงเหนือ").first
# prov.save

# # a = User.new( first_name: "Pinky", last_name: "Suriya", tel: "008188214", identity_number: "114004561258", birth_date: Date.yesterday )
# # b = CultivatedArea.new( longitude: 30, latitude:20, plantation: Plantation.first, user: a, plantation_date: Date.current )
# # c = CultivatedArea.new( longitude: 15, latitude:30, plantation: Plantation.find(2), user: a, plantation_date: Date.current )
# # a.save

# # a = User.new( first_name: "iXisTiC", last_name: "Gay", tel: "212224236", identity_number: "987654321", birth_date: Date.yesterday )
# # b = CultivatedArea.new( longitude: 5, latitude:12, plantation: Plantation.find(3), user: a, plantation_date: Date.current )
# # c = CultivatedArea.new( longitude: 4, latitude:9, plantation: Plantation.first, user: a, plantation_date: Date.current )
# # a.save
