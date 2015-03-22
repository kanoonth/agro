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
Stage.create( name: "Seedling", min_day: 0, max_day: 14 )
Stage.create( name: "Tillering", min_day: 15, max_day: 28 )
Stage.create( name: "Yielding", min_day: 29, max_day: 39 )
Stage.create( name: "Conceiving", min_day: 40, max_day: 45 )
Stage.create( name: "25day", min_day: 0, max_day: 25 )
Stage.create( name: "50day", min_day: 26, max_day: 50 )
Stage.create( name: "75day", min_day: 51, max_day: 75 )
Ecology.create( name: "Rain" ) 
Ecology.create( name: "Irrigation" )
AreaType.create( name: "Upland" )
AreaType.create( name: "Lowland" )
Plantation.create( name: "Indirect" ) 	# puk dam
Plantation.create( name: "Sow" ) 		# hwan
Plantation.create( name: "Drop" )		# yod
SoilType.create( name: "Clay" )
SoilType.create( name: "Mold" )
SoilType.create( name: "Sandy" )

#################################################################################

##### Disease
a = Disease.new(name: "Rice Blast")

##### DiseaseName
# a.disease_names << DiseaseName.new(name: "Left Blight_B")
# a.disease_names << DiseaseName.new(name: "Left Blight_C")

a.save

##### Stage
b = StageCertaintyFactor.new( cf: 0.75 )
b.disease = a
b.stage = Stage.where(name: "Seedling" ).first
b.save

c = StageCertaintyFactor.new( cf: 0.75 )
c.disease = a
c.stage = Stage.where(name: "Tillering" ).first
c.save

d = StageCertaintyFactor.new( cf: 0.5 )
d.disease = a
d.stage = Stage.where(name: "Yielding" ).first
d.save

e = StageCertaintyFactor.new( cf: 0.25 )
e.disease = a
e.stage = Stage.where(name: "Conceiving" ).first
e.save

##### Nutrient
f = Nitrogen.new(min: 28, max: 0, cf: 0.5)
f.disease = a
f.stage = Stage.where(name: "Tillering").first
f.save

g = Phosphoru.new(min: 8, max: 0, cf: 0.5)
g.disease = a
g.stage = Stage.where(name: "25day").first
g.save

h = Phosphoru.new(min: 2.6, max: 0, cf: 0.5)
h.disease = a
h.stage = Stage.where(name: "50day").first
h.save

i = Phosphoru.new(min: 3.6, max: 0, cf: 0.5)
i.disease = a
i.stage = Stage.where(name: "75day").first
i.save

# hi = Phosphoru.new(min: 0, max: 0.3, cf: 0.5)
# hi.disease = a
# hi.stage = Stage.where(name: "Tillering").first
# hi.save

j = Potassium.new(min: 42, max: 0, cf: 0.5)
j.disease = a
j.stage = Stage.where(name: "25day").first
j.save

k = Potassium.new(min: 40, max: 0, cf: 0.5)
k.disease = a
k.stage = Stage.where(name: "50day").first
k.save

l = Potassium.new(min: 36, max: 0, cf: 0.5)
l.disease = a
l.stage = Stage.where(name: "75day").first
l.save

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first
m.save

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first
n.save

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first
o.save

p = RegionCertaintyFactor.new(cf: 0.5)
p.disease = a
p.region = Region.where(name: "Center").first
p.save

q = RegionCertaintyFactor.new(cf: 0.75)
q.disease = a
q.region = Region.where(name: "South").first
q.save

r = RegionCertaintyFactor.new(cf: 0.75)
r.disease = a
r.region = Region.where(name: "West").first
r.save

##### Plantation
s = PlantationCertaintyFactor.new( cf: 0.25 )
s.disease = a
s.plantation = Plantation.where(name: "Indirect").first
s.save

t = PlantationCertaintyFactor.new( cf: 0.75 )
t.disease = a
t.plantation = Plantation.where(name: "Sow").first
t.save

u = PlantationCertaintyFactor.new( cf: 0.25 )
u.disease = a
u.plantation = Plantation.where(name: "Drop").first
u.save

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.75 )
v.disease = a
v.ecology = Ecology.where(name: "Rain").first
v.save

w = EcologyCertaintyFactor.new( cf: 0.25 )
w.disease = a
w.ecology = Ecology.where(name: "Irrigation").first
w.save

##### Area_type
# x = AreaTypeCertaintyFactor.new( cf: 0.25 )
# x.disease = a
# x.area_type = AreaType.where(name: "AreaType_A").first
# x.save

# y = AreaTypeCertaintyFactor.new( cf: 0.25 )
# y.disease = a
# y.area_type = AreaType.where(name: "AreaType_B").first
# y.save

##### Air
aa = Temperature.new( min: 22, max: 28, cf: 0.75 )
aa.disease = a
aa.save

bb = AirMoisture.new( min: 80, max: 100, cf: 0.75 )
bb.disease = a
bb.save

cc = Wind.new( min: 0, max: 5, cf: 0.75 )
cc.disease = a
cc.save

dd = SoilMoisture.new( min:0, max: 35, cf: 0.75 )
dd.disease = a
dd.save

#################################################################################

##### Disease
a = Disease.new(name: "Dirty Panicle")

##### DiseaseName
# a.disease_names << DiseaseName.new(name: "Dirty Panicle_B")
# a.disease_names << DiseaseName.new(name: "Dirty Panicle_C")

a.save

##### Stage
b = StageCertaintyFactor.new( cf: 0 )
b.disease = a
b.stage = Stage.where(name: "Seedling" ).first
b.save

c = StageCertaintyFactor.new( cf: 0 )
c.disease = a
c.stage = Stage.where(name: "Tillering" ).first
c.save

d = StageCertaintyFactor.new( cf: 0.75 )
d.disease = a
d.stage = Stage.where(name: "Yielding" ).first
d.save

e = StageCertaintyFactor.new( cf: 0.25 )
e.disease = a
e.stage = Stage.where(name: "Conceiving" ).first
e.save

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first
m.save

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first
n.save

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first
o.save

p = RegionCertaintyFactor.new(cf: 0.75)
p.disease = a
p.region = Region.where(name: "Center").first
p.save

q = RegionCertaintyFactor.new(cf: 0.75)
q.disease = a
q.region = Region.where(name: "South").first
q.save

r = RegionCertaintyFactor.new(cf: 0.75)
r.disease = a
r.region = Region.where(name: "West").first
r.save

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.25 )
v.disease = a
v.ecology = Ecology.where(name: "Rain").first
v.save

w = EcologyCertaintyFactor.new( cf: 0.75 )
w.disease = a
w.ecology = Ecology.where(name: "Irrigation").first
w.save

##### Air
aa = Temperature.new( min: 35, max: 40, cf: 0.75 )
aa.disease = a
aa.save

cc = Wind.new( min: 29, max: 38, cf: 0.75 )
cc.disease = a
cc.save

dd = Rain.new( min:35, max: 90, cf: 0.75 )
dd.disease = a
dd.save

#################################################################################

##### Disease
a = Disease.new(name: "Bacterial Leaf Blight")

##### DiseaseName
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

a.save

##### Stage
b = StageCertaintyFactor.new( cf: 0.5 )
b.disease = a
b.stage = Stage.where(name: "Seedling" ).first
b.save

c = StageCertaintyFactor.new( cf: 0.75 )
c.disease = a
c.stage = Stage.where(name: "Tillering" ).first
c.save

d = StageCertaintyFactor.new( cf: 0.5 )
d.disease = a
d.stage = Stage.where(name: "Yielding" ).first
d.save

e = StageCertaintyFactor.new( cf: 0 )
e.disease = a
e.stage = Stage.where(name: "Conceiving" ).first
e.save

##### Nutrient
f = Nitrogen.new(min: 28, max: 0, cf: 0.5)
f.disease = a
f.stage = Stage.where(name: "Tillering").first
f.save

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first
m.save

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first
n.save

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first
o.save

p = RegionCertaintyFactor.new(cf: 0.5)
p.disease = a
p.region = Region.where(name: "Center").first
p.save

q = RegionCertaintyFactor.new(cf: 0.75)
q.disease = a
q.region = Region.where(name: "South").first
q.save

r = RegionCertaintyFactor.new(cf: 0.5)
r.disease = a
r.region = Region.where(name: "West").first
r.save

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.75 )
v.disease = a
v.ecology = Ecology.where(name: "Rain").first
v.save

w = EcologyCertaintyFactor.new( cf: 0.75 )
w.disease = a
w.ecology = Ecology.where(name: "Irrigation").first
w.save

##### Air
aa = Temperature.new( min: 25, max: 34, cf: 0.75 )
aa.disease = a
aa.save

bb = AirMoisture.new( min: 70, max: 100, cf: 0.75 )
bb.disease = a
bb.save

cc = Wind.new( min: 29, max: 38, cf: 0.75 )
cc.disease = a
cc.save

dd = SoilMoisture.new( min:65, max: 100, cf: 0.75 )
dd.disease = a
dd.save

ee = Rain.new( min:10, max: 35, cf: 0.75 )
ee.disease = a
ee.save

#################################################################################

##### Disease
a = Disease.new(name: "Brown Spot")

##### DiseaseName
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

a.save

##### Stage
b = StageCertaintyFactor.new( cf: 0.5 )
b.disease = a
b.stage = Stage.where(name: "Seedling" ).first
b.save

c = StageCertaintyFactor.new( cf: 0.75 )
c.disease = a
c.stage = Stage.where(name: "Tillering" ).first
c.save

d = StageCertaintyFactor.new( cf: 0.5 )
d.disease = a
d.stage = Stage.where(name: "Yielding" ).first
d.save

e = StageCertaintyFactor.new( cf: 0.25 )
e.disease = a
e.stage = Stage.where(name: "Conceiving" ).first
e.save

##### Nutrient
f = Nitrogen.new(min: 0, max: 24, cf: 0.5)
f.disease = a
f.stage = Stage.where(name: "Tillering").first
f.save

g = Phosphoru.new(min: 0, max: 7, cf: 0.5)
g.disease = a
g.stage = Stage.where(name: "25day").first
g.save

h = Phosphoru.new(min: 0, max: 1.8, cf: 0.5)
h.disease = a
h.stage = Stage.where(name: "50day").first
h.save

i = Phosphoru.new(min: 0, max: 2.6, cf: 0.5)
i.disease = a
i.stage = Stage.where(name: "75day").first
i.save

hi = Phosphoru.new(min: 0, max: 0.3, cf: 0.5)
hi.disease = a
hi.stage = Stage.where(name: "Tillering").first
hi.save

j = Potassium.new(min: 0, max: 37, cf: 0.5)
j.disease = a
j.stage = Stage.where(name: "25day").first
j.save

k = Potassium.new(min: 0, max: 37, cf: 0.5)
k.disease = a
k.stage = Stage.where(name: "50day").first
k.save

l = Potassium.new(min: 0, max: 35, cf: 0.5)
l.disease = a
l.stage = Stage.where(name: "75day").first
l.save

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first
m.save

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first
n.save

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first
o.save

p = RegionCertaintyFactor.new(cf: 0.75)
p.disease = a
p.region = Region.where(name: "Center").first
p.save

q = RegionCertaintyFactor.new(cf: 0.75)
q.disease = a
q.region = Region.where(name: "South").first
q.save

r = RegionCertaintyFactor.new(cf: 0.75)
r.disease = a
r.region = Region.where(name: "West").first
r.save

##### Plantation
s = PlantationCertaintyFactor.new( cf: 0.75 )
s.disease = a
s.plantation = Plantation.where(name: "Indirect").first
s.save

t = PlantationCertaintyFactor.new( cf: 0.75 )
t.disease = a
t.plantation = Plantation.where(name: "Sow").first
t.save

u = PlantationCertaintyFactor.new( cf: 0.75 )
u.disease = a
u.plantation = Plantation.where(name: "Drop").first
u.save

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.75 )
v.disease = a
v.ecology = Ecology.where(name: "Rain").first
v.save

w = EcologyCertaintyFactor.new( cf: 0.75 )
w.disease = a
w.ecology = Ecology.where(name: "Irrigation").first
w.save

##### Air
aa = Temperature.new( min: 16, max: 36, cf: 0.75 )
aa.disease = a
aa.save

bb = AirMoisture.new( min: 86, max: 100, cf: 0.75 )
bb.disease = a
bb.save

cc = Wind.new( min: 29, max: 38, cf: 0.75 )
cc.disease = a
cc.save

#################################################################################

##### Disease
a = Disease.new(name: "Bakanae")

##### DiseaseName
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

a.save

##### Stage
b = StageCertaintyFactor.new( cf: 0.5 )
b.disease = a
b.stage = Stage.where(name: "Seedling" ).first
b.save

c = StageCertaintyFactor.new( cf: 0.75 )
c.disease = a
c.stage = Stage.where(name: "Tillering" ).first
c.save

d = StageCertaintyFactor.new( cf: 0.25 )
d.disease = a
d.stage = Stage.where(name: "Yielding" ).first
d.save

e = StageCertaintyFactor.new( cf: 0.25 )
e.disease = a
e.stage = Stage.where(name: "Conceiving" ).first
e.save

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first
m.save

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first
n.save

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first
o.save

p = RegionCertaintyFactor.new(cf: 0.5)
p.disease = a
p.region = Region.where(name: "Center").first
p.save

q = RegionCertaintyFactor.new(cf: 0.75)
q.disease = a
q.region = Region.where(name: "South").first
q.save

r = RegionCertaintyFactor.new(cf: 0.75)
r.disease = a
r.region = Region.where(name: "West").first
r.save

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.75 )
v.disease = a
v.ecology = Ecology.where(name: "Rain").first
v.save

#################################################################################

##### Disease
a = Disease.new(name: "Narrow Brown Spot")

##### DiseaseName
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

a.save

##### Stage
b = StageCertaintyFactor.new( cf: 0.25 )
b.disease = a
b.stage = Stage.where(name: "Seedling" ).first
b.save

c = StageCertaintyFactor.new( cf: 0.5 )
c.disease = a
c.stage = Stage.where(name: "Tillering" ).first
c.save

d = StageCertaintyFactor.new( cf: 0.75 )
d.disease = a
d.stage = Stage.where(name: "Yielding" ).first
d.save

e = StageCertaintyFactor.new( cf: 0.75 )
e.disease = a
e.stage = Stage.where(name: "Conceiving" ).first
e.save

##### Nutrient
j = Potassium.new(min: 0, max: 37, cf: 0.5)
j.disease = a
j.stage = Stage.where(name: "25day").first
j.save

k = Potassium.new(min: 0, max: 37, cf: 0.5)
k.disease = a
k.stage = Stage.where(name: "50day").first
k.save

l = Potassium.new(min: 0, max: 35, cf: 0.5)
l.disease = a
l.stage = Stage.where(name: "75day").first
l.save

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first
m.save

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first
n.save

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first
o.save

p = RegionCertaintyFactor.new(cf: 0.75)
p.disease = a
p.region = Region.where(name: "Center").first
p.save

q = RegionCertaintyFactor.new(cf: 0.75)
q.disease = a
q.region = Region.where(name: "South").first
q.save

r = RegionCertaintyFactor.new(cf: 0.75)
r.disease = a
r.region = Region.where(name: "West").first
r.save

##### Plantation
s = PlantationCertaintyFactor.new( cf: 0.75 )
s.disease = a
s.plantation = Plantation.where(name: "Indirect").first
s.save

t = PlantationCertaintyFactor.new( cf: 0.75 )
t.disease = a
t.plantation = Plantation.where(name: "Sow").first
t.save

u = PlantationCertaintyFactor.new( cf: 0.75 )
u.disease = a
u.plantation = Plantation.where(name: "Drop").first
u.save

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.75 )
v.disease = a
v.ecology = Ecology.where(name: "Rain").first
v.save

w = EcologyCertaintyFactor.new( cf: 0.75 )
w.disease = a
w.ecology = Ecology.where(name: "Irrigation").first
w.save

##### Air
aa = Temperature.new( min: 16, max: 36, cf: 0.75 )
aa.disease = a
aa.save

cc = Wind.new( min: 29, max: 38, cf: 0.75 )
cc.disease = a
cc.save

#################################################################################

##### Disease
a = Disease.new(name: "Root Knot")

##### DiseaseName
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

a.save

##### Stage
b = StageCertaintyFactor.new( cf: 0.75 )
b.disease = a
b.stage = Stage.where(name: "Seedling" ).first
b.save

c = StageCertaintyFactor.new( cf: 0.5 )
c.disease = a
c.stage = Stage.where(name: "Tillering" ).first
c.save

d = StageCertaintyFactor.new( cf: 0 )
d.disease = a
d.stage = Stage.where(name: "Yielding" ).first
d.save

e = StageCertaintyFactor.new( cf: 0 )
e.disease = a
e.stage = Stage.where(name: "Conceiving" ).first
e.save

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first
m.save

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first
n.save

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first
o.save

p = RegionCertaintyFactor.new(cf: 0.5)
p.disease = a
p.region = Region.where(name: "Center").first
p.save

q = RegionCertaintyFactor.new(cf: 0.5)
q.disease = a
q.region = Region.where(name: "South").first
q.save

r = RegionCertaintyFactor.new(cf: 0.5)
r.disease = a
r.region = Region.where(name: "West").first
r.save

##### Plantation
t = PlantationCertaintyFactor.new( cf: 0.75 )
t.disease = a
t.plantation = Plantation.where(name: "Sow").first
t.save

u = PlantationCertaintyFactor.new( cf: 0.75 )
u.disease = a
u.plantation = Plantation.where(name: "Drop").first
u.save

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.75 )
v.disease = a
v.ecology = Ecology.where(name: "Rain").first
v.save

##### AreaType
x = AreaTypeCertaintyFactor.new( cf:0.75 )
x.disease = a
x.area_type = AreaType.where(name: "Upland").first
x.save

##### Air
bb = AirMoisture.new( min: 0, max: 35, cf: 0.75 )
bb.disease = a
bb.save

cc = SoilMoisture.new( min: 0, max: 35, cf: 0.75 )
cc.disease = a
cc.save

#################################################################################

##### Disease
a = Disease.new(name: "Stem Rot")

##### DiseaseName
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_B")
# a.disease_names << DiseaseName.new(name: "Bacterial Leaf Blight_C")

a.save

##### Stage
b = StageCertaintyFactor.new( cf: 0.25 )
b.disease = a
b.stage = Stage.where(name: "Seedling" ).first
b.save

c = StageCertaintyFactor.new( cf: 0.75 )
c.disease = a
c.stage = Stage.where(name: "Tillering" ).first
c.save

d = StageCertaintyFactor.new( cf: 0.75 )
d.disease = a
d.stage = Stage.where(name: "Yielding" ).first
d.save

e = StageCertaintyFactor.new( cf: 0.5 )
e.disease = a
e.stage = Stage.where(name: "Conceiving" ).first
e.save

##### Nutrient
f = Nitrogen.new(min: 28, max: 0, cf: 0.5)
f.disease = a
f.stage = Stage.where(name: "Tillering").first
f.save

##### Region
m = RegionCertaintyFactor.new(cf: 0.75)
m.disease = a
m.region = Region.where(name: "North").first
m.save

n = RegionCertaintyFactor.new(cf: 0.5)
n.disease = a
n.region = Region.where(name: "East").first
n.save

o = RegionCertaintyFactor.new(cf: 0.75)
o.disease = a
o.region = Region.where(name: "North_East").first
o.save

p = RegionCertaintyFactor.new(cf: 0.75)
p.disease = a
p.region = Region.where(name: "Center").first
p.save

q = RegionCertaintyFactor.new(cf: 0.75)
q.disease = a
q.region = Region.where(name: "South").first
q.save

r = RegionCertaintyFactor.new(cf: 0.5)
r.disease = a
r.region = Region.where(name: "West").first
r.save

##### Ecology
v = EcologyCertaintyFactor.new( cf: 0.75 )
v.disease = a
v.ecology = Ecology.where(name: "Rain").first
v.save

w = EcologyCertaintyFactor.new( cf: 0.75 )
w.disease = a
w.ecology = Ecology.where(name: "Irrigation").first
w.save

##### SoilType
x = SoilTypeCertaintyFactor.new( cf: 0.75 )
x.disease = a
x.soil_type = SoilType.where(name: "Clay").first
x.save

y = SoilTypeCertaintyFactor.new( cf: 0.5 )
y.disease = a
y.soil_type = SoilType.where(name: "Mold").first
y.save

z = SoilTypeCertaintyFactor.new( cf: 0.75 )
z.disease = a
z.soil_type = SoilType.where(name: "Sandy").first
z.save

##### Air
aa = Temperature.new( min: 30, max: 50, cf: 0.75 )
aa.disease = a
aa.save

bb = AirMoisture.new( min: 0, max: 35, cf: 0.75 )
bb.disease = a
bb.save

cc = SoilMoisture.new( min: 65, max: 100, cf: 0.75 )
cc.disease = a
cc.save

##################################################################
prov = Province.new( name: "Bangkok")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Amnat Charoen")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Ang Thong")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Bueng Kan")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Buriram")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Chachoengsao")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Chainat")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Chaiyaphum")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Chanthaburi")
prov.region = Region.where(name: "East").first
prov.save

prov = Province.new( name: "Chiang Mai")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Chiang Rai")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Chonburi")
prov.region = Region.where(name: "East").first
prov.save

prov = Province.new( name: "Chumphon")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Kalasin")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Kamphaeng Phet")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Kanchanaburi")
prov.region = Region.where(name: "West").first
prov.save

prov = Province.new( name: "Khon Kaen")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Krabi")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Lampang")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Lamphun")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Loei")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Lopburi")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Mae Hong Son")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Maha Sarakham")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Mukdahan")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Nakhon Nayok")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Nakhon Pathom")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Nakhon Phanom")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Nakhon Ratchasima")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Nakhon Sawan")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Nakhon Si Thammarat")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Nan")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Narathiwat")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Nong Bua Lamphu")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Nong Khai")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Nonthaburi")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Pathum Thani")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Pattani")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Phang Nga")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Phatthalung")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Phayao")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Phetchabun")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Phetchaburi")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Phichit")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Phitsanulok")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Phra Nakhon Si Ayutthaya")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Phrae")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Phuket")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Prachinburi")
prov.region = Region.where(name: "East").first
prov.save

prov = Province.new( name: "Prachuap Khiri Khan")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Ranong")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Ratchaburi")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Rayong")
prov.region = Region.where(name: "East").first
prov.save

prov = Province.new( name: "Roi Et")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Sa Kaeo")
prov.region = Region.where(name: "East").first
prov.save

prov = Province.new( name: "Sakon Nakhon")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Samut Prakan")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Samut Sakhon")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Samut Songkhram")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Saraburi")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Satun")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Sing Buri")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Sisaket")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Songkhla")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Sukhothai")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Suphan Buri")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Surat Thani")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Surin")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Tak")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Trang")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Trat")
prov.region = Region.where(name: "East").first
prov.save

prov = Province.new( name: "Ubon Ratchathani")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Udon Thani")
prov.region = Region.where(name: "North_East").first
prov.save

prov = Province.new( name: "Uthai Thani")
prov.region = Region.where(name: "Center").first
prov.save

prov = Province.new( name: "Uttaradit")
prov.region = Region.where(name: "North").first
prov.save

prov = Province.new( name: "Yala")
prov.region = Region.where(name: "South").first
prov.save

prov = Province.new( name: "Yasothon")
prov.region = Region.where(name: "North_East").first
prov.save