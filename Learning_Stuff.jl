#%% Multiple Dispatch
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

sum::Int64 = 0
#%% Plotting a

using Pkg
Pkg.add("Plots")

using Plots

#plotly() # option 1
#gr()  	  # option 2

x = 1:0.01:10*π
y = sin.(x)
y2=sin.(x).^2

plot(x, y, label="sin(x)")
plot!(xlab="x", ylab="f(x)")
plot!(x, y2, label="sin(x)^2", color=:red, line=:dash)

#%% Plotting b
using Pkg
Pkg.add("PyPlot")

using Plots
pyplot()

Pkg.add("LaTeXStrings")
using LaTeXStrings

x=0:0.1:2*π
y=sin.(x).^2

plot(x, y, label=L"$\sin(x)^2$")
savefig("img3.png")
#%% Numerical Integration
using Pkg
Pkg.add("QuadGK")

using QuadGK

func1(x) = exp(-x^2)
res, err = quadgk(func1, -Inf, Inf, rtol=1e-15)


func2(x, y, z) = x + y^3 + sin(z) # Multiple variables

x = 5
z = 3
arg(y) = func2(x, y, z)
quadgk(arg, 1, 3)


res, err = let x=5; z=3
    arg(y) = func2(x, y, z)
    
    quadgk(arg, 1, 3)
end

#%%

fptr = open("Textfil.txt", "r")

a = readline(fptr)
b = readline(fptr)
c = readline(fptr)
d = readline(fptr)

e = parse(Int32, d)

A = map(x -> parse(Int32, x), Array{String}(split(readline(fptr))))

print(A)

close(fptr)

#%% Units of measurement

using Pkg
Pkg.add("Unitful")
#%%
using Unitful


one_meter = 1u"m"

b = uconvert(u"km", one_meter)

c = ustrip(u"m", one_meter)

function compute_speed(Δx, Δt)
    return Δx/Δt
end

compute_speed(1u"km", 2u"s")

#%%

arr = [1 1 1 0 0 0;
0 1 0 0 0 0;
1 1 1 0 0 0;
0 0 2 4 4 0;
0 0 0 2 0 0;
0 0 1 2 4 0]

arr2 = [3 7 -3 0 1 8;
1 -4 -7 -8 -6 5;
-8 1 3 3 5 7;
-2 4 3 1 2 7;
2 4 -5 1 8 4;
5 -7 6 5 2 8]

function hourglassSum(arr)
    max_sum = 0
    for row = 1:4
        for column = 2:5
            sum = arr[row,column-1] + arr[row+2,column-1] +
            + arr[row,column] + arr[row+1,column] + arr[row+2,column] +
            + arr[row,column+1] + arr[row+2,column+1]
			println(sum)
            if sum > max_sum
                max_sum = sum
            end
        end
    end    
    return max_sum
end

result = hourglassSum(arr2)

print(result)

