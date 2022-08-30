#%%
abstract type Person
end

abstract type Musician <: Person
end

mutable struct Rockstar <: Musician
	name::String
	instrument::String
	bandName::String
	headbandColor::String
	instrumentsPlayed::Int
end

struct ClassicMusician <: Musician
	name::String
	instrument::String
end

mutable struct Physicist <: Person
	name::String
	sleepHours::Float64
	favouriteLanguage::String
end

aure = Physicist("Aurelio", 6, "Julia")

# aure.name

aure_musician = ClassicMusician("Aurelio", "Violin")

ricky = Rockstar("Riccardo", "Voice", "Black Lotus", "red", 2)

function introduceMe(person::Rockstar)
	if person.instrument == "Voice"
		println("Hello, my name is $(person.name) and I sing.")
	else
		println("Hello, my name is $(person.name) and I play $(person.instrument).")
	end

	println("My band name is $(person.bandName) and my favourite headband colour is $(person.headbandColor)!")
end

introduceMe(ricky)

mutable struct MyData
	x::Float64
	x2::Float64
	y::Float64
	z::Float64
	function MyData(x::Float64, y::Float64)
		x2=x^2
		z = sin(x2+y)
		new(x, x2, y, z)
	end
end

MyData(2.0, 3.0)


#%%