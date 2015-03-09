# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Region.create( name: "North" )
Region.create( name: "North_East" )
Region.create( name: "Center" )
Region.create( name: "East" )
Region.create( name: "South" )
Region.create( name: "West" )
Stage.create( name: "Stage_A", min_day: 0, max_day: 14 )
Stage.create( name: "Stage_B", min_day: 15, max_day: 28 )
Stage.create( name: "Stage_C", min_day: 29, max_day: 39 )
Stage.create( name: "Stage_D", min_day: 40, max_day: 45 )
Stage.create( name: "25day", min_day: 0, max_day: 25 )
Stage.create( name: "50day", min_day: 26, max_day: 50 )
Stage.create( name: "75day", min_day: 51, max_day: 75 )
Ecology.create( name: "Ecology_A" )
Ecology.create( name: "Ecology_B" )
Ecology.create( name: "Ecology_C" )
AreaType.create( name: "AreaType_A" )
AreaType.create( name: "AreaType_B" )
Plantation.create( name: "Plantation_A" )
Plantation.create( name: "Plantation_B" )
Plantation.create( name: "Plantation_C" )
SoilType.create( name: "SoilType_A" )
SoilType.create( name: "SoilType_B" )

#################################################################################

##### Disease
a = Disease.new(name: "Left Blight")

##### DiseaseName
a.disease_names << DiseaseName.new(name: "Left Blight_B")
a.disease_names << DiseaseName.new(name: "Left Blight_C")

##### Stage
b = StageCertaintyFactor.new( cf: 0.75 )
b.disease = a
b.stage = Stage.where(name: "Stage_A" ).first

c = StageCertaintyFactor.new( cf: 0.75 )
c.disease = a
c.stage = Stage.where(name: "Stage_B" ).first

d = StageCertaintyFactor.new( cf: 0.5 )
d.disease = a
d.stage = Stage.where(name: "Stage_C" ).first

e = StageCertaintyFactor.new( cf: 0.25 )
e.disease = a
e.stage = Stage.where(name: "Stage_D" ).first

##### Nritrient
f = Nitrogen.new(min: 28, max: 0, cf: 0.5)
f.disease = a
f.stage = Stage.where(name: "Stage_B").first

g = Phosphoru.new(min: 8, max: 0, cf: 0.5)
g.disease = a
g.stage = Stage.where(name: "25day").first

h = Phosphoru.new(min: 2.6, max: 0, cf: 0.5)
h.disease = a
h.stage = Stage.where(name: "50day").first

i = Phosphoru.new(min: 3.6, max: 0, cf: 0.5)
i.disease = a
i.stage = Stage.where(name: "75day").first

hi = Phosphoru.new(min: 0, max: 0.3, cf: 0.5)
hi.disease = a
hi.stage = Stage.where(name: "Stage_B").first
hi.save

j = Potassium.new(min: 42, max: 0, cf: 0.5)
j.disease = a
j.stage = Stage.where(name: "25day").first

k = Potassium.new(min: 40, max: 0, cf: 0.5)
k.disease = a
k.stage = Stage.where(name: "50day").first

l = Potassium.new(min: 36, max: 0, cf: 0.5)
l.disease = a
l.stage = Stage.where(name: "75day").first

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first

p = RegionCertaintyFactor.new(cf: 0.5)
p.disease = a
p.region = Region.where(name: "Center").first

q = RegionCertaintyFactor.new(cf: 0.75)
q.disease = a
q.region = Region.where(name: "South").first

r = RegionCertaintyFactor.new(cf: 0.75)
r.disease = a
r.region = Region.where(name: "West").first

##### Plantation
s = PlantationCertaintyFactor.new( cf: 0.25 )
s.disease = a
s.plantation = Plantation.where(name: "Plantation_A").first

t = PlantationCertaintyFactor.new( cf: 0.75 )
t.disease = a
t.plantation = Plantation.where(name: "Plantation_B").first

u = PlantationCertaintyFactor.new( cf: 0.25 )
u.disease = a
u.plantation = Plantation.where(name: "Plantation_C").first

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.75 )
v.disease = a
v.ecology = Ecology.where(name: "Ecology_A").first

w = EcologyCertaintyFactor.new( cf: 0.25 )
w.disease = a
w.ecology = Ecology.where(name: "Ecology_B").first

##### Area_type
# x = AreaTypeCertaintyFactor.new( cf: 0.25 )
# x.disease = a
# x.area_type = AreaType.where(name: "AreaType_A").first

# y = AreaTypeCertaintyFactor.new( cf: 0.25 )
# y.disease = a
# y.area_type = AreaType.where(name: "AreaType_B").first

##### Air
aa = Temperature.new( min: 22, max: 28, cf: 0.75 )
aa.disease = a

bb = AirMoisture.new( min: 80, max: 100, cf: 0.75 )
bb.disease = a

cc = Wind.new( min: 0, max: 5, cf: 0.75 )
cc.disease = a

dd = SoilMoisture.new( min:0, max: 35, cf: 0.75 )
dd.disease = a

a.save
b.save
c.save
d.save
e.save
f.save
g.save
h.save
i.save
j.save
k.save
l.save
m.save
n.save
o.save
p.save
q.save
r.save
s.save
t.save
u.save
v.save
w.save
# x.save
# y.save

aa.save
bb.save
cc.save
dd.save


#################################################################################

##### Disease
a = Disease.new(name: "Dirty Panicle")

##### DiseaseName
a.disease_names << DiseaseName.new(name: "Dirty Panicle_B")
a.disease_names << DiseaseName.new(name: "Dirty Panicle_C")

##### Stage
b = StageCertaintyFactor.new( cf: 0 )
b.disease = a
b.stage = Stage.where(name: "Stage_A" ).first

c = StageCertaintyFactor.new( cf: 0 )
c.disease = a
c.stage = Stage.where(name: "Stage_B" ).first

d = StageCertaintyFactor.new( cf: 0.75 )
d.disease = a
d.stage = Stage.where(name: "Stage_C" ).first

e = StageCertaintyFactor.new( cf: 0.50 )
e.disease = a
e.stage = Stage.where(name: "Stage_D" ).first

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first

p = RegionCertaintyFactor.new(cf: 0.75)
p.disease = a
p.region = Region.where(name: "Center").first

q = RegionCertaintyFactor.new(cf: 0.75)
q.disease = a
q.region = Region.where(name: "South").first

r = RegionCertaintyFactor.new(cf: 0.75)
r.disease = a
r.region = Region.where(name: "West").first

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.25 )
v.disease = a
v.ecology = Ecology.where(name: "Ecology_A").first

w = EcologyCertaintyFactor.new( cf: 0.75 )
w.disease = a
w.ecology = Ecology.where(name: "Ecology_B").first

##### Air
aa = Temperature.new( min: 35, max: 40, cf: 0.75 )
aa.disease = a

cc = Wind.new( min: 29, max: 38, cf: 0.75 )
cc.disease = a

dd = Rain.new( min:35, max: 90, cf: 0.75 )
dd.disease = a

a.save
b.save
c.save
d.save
e.save
m.save
n.save
o.save
p.save
q.save
r.save
v.save
w.save

aa.save
cc.save
dd.save


#################################################################################

##### Disease
a = Disease.new(name: "Bacterial Leaf Blight")

##### DiseaseName
a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

##### Stage
b = StageCertaintyFactor.new( cf: 0.5 )
b.disease = a
b.stage = Stage.where(name: "Stage_A" ).first

c = StageCertaintyFactor.new( cf: 0.75 )
c.disease = a
c.stage = Stage.where(name: "Stage_B" ).first

d = StageCertaintyFactor.new( cf: 0.5 )
d.disease = a
d.stage = Stage.where(name: "Stage_C" ).first

e = StageCertaintyFactor.new( cf: 0 )
e.disease = a
e.stage = Stage.where(name: "Stage_D" ).first

##### Nritrient
f = Nitrogen.new(min: 28, max: 0, cf: 0.5)
f.disease = a
f.stage = Stage.where(name: "Stage_B").first

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first

p = RegionCertaintyFactor.new(cf: 0.5)
p.disease = a
p.region = Region.where(name: "Center").first

q = RegionCertaintyFactor.new(cf: 0.75)
q.disease = a
q.region = Region.where(name: "South").first

r = RegionCertaintyFactor.new(cf: 0.5)
r.disease = a
r.region = Region.where(name: "West").first

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.75 )
v.disease = a
v.ecology = Ecology.where(name: "Ecology_A").first

w = EcologyCertaintyFactor.new( cf: 0.75 )
w.disease = a
w.ecology = Ecology.where(name: "Ecology_B").first

##### Air
aa = Temperature.new( min: 25, max: 34, cf: 0.75 )
aa.disease = a

bb = AirMoisture.new( min: 70, max: 100, cf: 0.75 )
bb.disease = a

cc = Wind.new( min: 29, max: 38, cf: 0.75 )
cc.disease = a

dd = SoilMoisture.new( min:65, max: 100, cf: 0.75 )
dd.disease = a

ee = Rain.new( min:10, max: 35, cf: 0.75 )
ee.disease = a

a.save
b.save
c.save
d.save
e.save
f.save
m.save
n.save
o.save
p.save
q.save
r.save
v.save
w.save


aa.save
bb.save
cc.save
dd.save
ee.save