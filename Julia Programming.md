



# Julia Programming 

## Basics:

- Visual Studio as IDE
- Block: #%%, start and end
- Comment: #
- Run a line: Ctrl+Enter
- Run a block: Alt+Enter
- Rational numbers possible, eg. 2 // 3
- Help, use ? in command line, then follow up
- Ctrl+l to clear terminal
- Cannot delete variables except by restarting?!
- Column major order in arrays!
- Can add Latex symbols: eg. \delta<tab>

## Types:

Julia can infer the data type, unlike C, no need to specify type

- To get the type use: typeof()
- Convert one type to another: convert("type", x)
- char - 1 byte (256 options) usually enclosed as 'A'
- string - 1 byte per char, usually enclosed as "Hello"
- int - 4 bytes, 2^(32-1) = 2,147,483,647, 1 signed bit
- float (single precision) - 4 bytes, 8 bits for exponent (1 signed), 24 bits for number (1 signed)
- ![image-20220901202622676](C:\Users\Johan\AppData\Roaming\Typora\typora-user-images\image-20220901202622676.png)

## Functions:

- Starts with: function + name("inputs")

- Indent content, indentation not as strict as python but should be followed the same way

- Finish with: end

- If a variable is to be returned from function: return

- Functions can also be written inline

- Anonymous functions possible but not recommended

- Optional positional arguments, can add a default input to a function but if a new input is added it changes: 

  ```
  function myWeight(weightOnEarth, g=9.81)
      return weightOnEarth*g/9.81
  end
  
  myWeight(60)
  myWeight(60, 3.72) # or this, g = 3.72
  ```

- Positional arguments must be in correct order unlike python

- Keyword arguments: separated using a ;. Can be optional like the positional. Order doesn't matter but must be specified by name always (unless default for optional)

- Positional has better performance! Faster

- Can write helpful explanation to function

  ```
  """
  Description of the function
  """
  function foo(x)
      #... function implementation
  end
  ```

- 

## Data Structures

- Vector and array used synonymously

- Array element accessed as: array_name[element_number]

- Indexing starts at 1 unlike python

- All vector elements must share the same type

- Append new value: append!("Vector", NewValue)

- The data type in an array can be specified: eg. d = Int[1,2,3,4,5]

- Matrix new row using ; (Matlab style). See below for creating and indexing

- ```
  table = zeros(2,3,4)
  for k in 1:4
      for j in 1:3
          for i in 1:2
              table[i,j,k] = i*j*k
          end
      end
  end
  ```

- i row, j column, k matrix

- List comprehension, a vector of elements 1 to 16, and nested variant

  ```
  A = [i for i in 1:16]
  [i+j for i in 1:10 for j in 1:5]
  ```

- Reshape a vector to a matrix, rows*columns must equal size of vector

  ```
  reshape(vector,rows,columns)
  ```

- Arrays are pointers to memory, hence if we set A=B and modify b, a is also modified!

- To copy an array use: copy(A)

- Tuple is a fixed SIZE group, but can contain different types

  ```
  tuple1 = (1,2,3)
  tuple2 = 1, 2, 3
  a, b, c = tuple1 (unpack)
  ```

- Dictionaries is a collection of keys and values. 

  ```
  person1 = Dict("Name" => "Aurelio", "Phone" => 123456789, "Shoe-size" => 40)
  person2 = Dict("Name" => "Elena", "Phone" => 123456789, "Shoe-size" => 36)
  
  addressBook = Dict("Aurelio" => person1, "Elena" => person2)
  
  person3 = Dict("Name" => "Vittorio", "Phone" => 123456789, "Shoe-size" => 42)
  addressBook["Vittorio"] = person3
  
  print(addressBook)
  
  ```

- Julia has a built in garbage collector, no need to free memory!

  ### Broadcasting

  - Matrix operations adhere to mathematical practice

  - If we want to do element by element calculations we use broadcasting: adding a . before operation, like Matlab

  - We can also map a function over an array with the .

    ```
    a = [1,2,3]
    >>> sin.(a)
        3-element Array{Float64,1}:
         0.8414709848078965
         0.9092974268256817
         0.1411200080598672
    ```

  - Just as fast as a for loop over the array 
  
  - Easier to do parallel programming with it later
  
  - Can pad and perform operation with higher dimensional matrix
  
    ```
    broadcast(+, a, A) # eg. a a variable and A a matrix
    ```
  
    

## Parsing

- Opening a file:

  ```
  filepointer = open("Textfile.txt", "r") #
  ```

![image-20220901163853689](C:\Users\Johan\AppData\Roaming\Typora\typora-user-images\image-20220901163853689.png)

- Write into a file and close:

  ```
  write(filepointer, "text")
  close(filepointer) # Always close afterwards
  ```

- Read one line from the file:

  ```
  readline(filepointer) # observe that we progress one line
  readline(filepointer) # read next line
  ```

- Handling the input:

  ```
  strip() 								 # Remove leading and trailing characters from string
  strip(str::AbstractString, chars) 			# choose the character
  
  parse(type, input)							# transform input to specified type
  
  split() 								# split into an array at specific character
  
  map(f,c) 								# Transform collection c by applying f to each element
  
  Array{String}(split(rstrip(readline(stdin)))) # Create an array of (strings)(default)
  
  map(x -> parse(Int32, x), Array{String}(split(rstrip(readline(stdin))))) # Create an array of Int32s
  
  
  ```

  

## Control Flow

- Enumerate example:

```
x = ["a","b","c"]
for couple in enumerate(x)
    println(couple)
end

(1, "a")
(2, "b")
(3, "c")
```

- It yields the index and entry in x
- In **Julia**, since for loops are already as fast as they can be (close to the speed of C) there is **no need to write vectorised code**, as the interpreter will directly compile your code in optimised machine code which will run as fast as possible on your machine.

### If Else

- Example of code:

- Try to put the most common condition in the then block after if (avoid flushing the pipeline)

  ```
  if x >= 0
  	x = x
  elseif x < 0
  	x = -x
  else
  	x = what
  end
  ```

- Different conditional statements:

- Chaining comparisons possible 

  ```
  &		# and 
  ||	 	# or
  ==		# Equality
  !=		# Inequality	
  <=		# Less or equal than
  >=		# Greater or equal than
  
  ```

- String interpolation: $x substitutes for x in a string. Eg. 

  ```
  x = 2
  print("$x < 100")
  ```

### For Loop

- Example

  ```
  for i in 1:10 # equivalent to: for i = 1:10			# forwards for loop
      println(i^2)
  end
  
  for i in 1:10 # equivalent to: for i = reverse(1:10) # backwards for loop
      println(i^2)
  end
  ```

- Can also iterate over entries in a list eg. vector or tuple

  ```
  persons = ["Alice", "Bob", "Carla", "Daniel"]
  
  for person in persons
      println("Hello $person, welcome to techytok!")
  end
  ```

- Break conditions exits a loop

- Continue condition will forcefully skip the current iteration and start the next

  ### While Loop

- Example: 

  ```
  function while_test()
      i=0
      while(i<30)
          println(i)
          i += 1
      end
  end
  ```

  ## Variable Scope

- The **scope** of a variable is the region of a program where the variable is known and accessible. A variable may live in two kind of scopes: the **global scope** or a **local scope**.

- For example, a module is in global scope

- A variable declared inside a function lives inside that function, unless it is returned!

- Let construct example:

  ```
  a = let
      i=3
      i+=5
      i # the value returned from the computation
  end
  
  >>>a
  8
  
  b = let i=5
      i+=42
      i
  end
  
  >>>b
  47
  ```

- it is generally advisable to **avoid using global variables** as much as possible, in fact since global variables can change their type and value at any time, they cannot be properly optimised by the compiler.

- Constants:

  ```
  >>> const C = 299792458 # m / s, this is an Int
  ```

- Since a constant is “type immutable” it can be properly optimised by the compiler and there are fewer performance issues.
- **Avoid using global variables** as much as possible, if global variables are needed **define them as `const`**
- Pass all the required parameters to a function instead of defining them as global variables, a function should be able to ideally operate only on its input.
- Use functions and let blocks to introduce local scopes where you can define as many variables as you desire without incurring in the risk of overlapping variable names with those used in other parts of your code.

## Modules

- Libraries in Julia come in the form of module

- A module is a separate environment with its sets of variables and functions, some of which are exported in the calling scope, example of loading a module

  ```
  using Pkg
  Pkg.add("SpecialFunctions")
  ```

- Example of a module

  ```
  using SpecialFunctions
  #using SpecialFunctions: gamma, sinint # if we want to use only these functions
  
  >>>gamma(3)
  2.00
  
  >>>sinint(5) #sine integral
  1.5499312449446743
  ```

- Can import as well but then we need to specify the module

  ```
  import SpecialFunctions
  
  >>>gamma(3)
  UndefVarError: gamma not defined
  
  >>>SpecialFunctions.gamma(3)
  2.0
  ```

- One can create a custom function with the same name in this case

- Create your own module:

  ```
  module MyModule
  export func2
  
  a=42
  function func1(x)
      return x^2
  end
  
  function func2(x)
      return func1(x) + a
  end
  
  end #end of module
  
  #%%
  
  using .MyModule # short for Main.MyModule
  
  >>>func2(3)
  51
  
  >>>func1(3)
  UndefVarError: func1 not defined
  
  >>>MyModule.func1(3)
  9
  ```

- The goal of a module is to write a set of functions, define a series of variables or types which can be easily reused in other programs

- Example of documentation for a function

  ````
  @doc raw"""
      func2big(x)
  
  Computes the square of `x` and add `a` to it.
  
  # Examples
  ```julia-repl
  julia> include("big-module.jl")
  julia> using .MyBigModule
  julia> func2big(3)
  51
  ```
  """
  function func2big(x)
      return func1big(x) + a
  end
  ````

  - https://techytok.com/lesson-modules/
  
    ### Different Modules To Use
  
    ```
    using Pkg
    Pkg.add("Plots") 	# Plotting functions
    Pkg.add("QuadGK")	# Numerical integration
    Pkg.add("Unitful")	# To use units in code, added as u"m", u for unit and indicator "m"
    Pkg.add("PyCall")	# Python include
    Pkg.add("Profile")  # Profiling functions
    Pkg.add("BenchmarkTools ") # Measure speed
    Pkg.add("Unitful")	# Units of measurement
    
    using "package_name" # Dont forget
    ```
    
    

## Types

- Abstract and concrete types

- Can specify type of something using: ::type

- We can think of types as containers for data only. Moreover, it is possible to define a type hierarchy so that functions that work for parent type work also for the children

  ```
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
  ```

- Musician a subtype to Person, and Rockstar and ClassicMusician subtypes of it

- Mutable means it can be changed

- Can add another type, physicist and give it some defined values

- We can also make this person a ClassicMusician

  ```
  mutable struct Physicist <: Person
  	name::String
  	sleepHours::Float64
  	favouriteLanguage::String
  end
  
  aure = Physicist("Aurelio", 6, "Julia")
  >>>aure.name
  Aurelio
  
  >>>aure.sleepHours
  6
  
  >>>aure.favouriteLanguage
  "Julia"
  
  #%%
  
  aure_musician = ClassicMusician("Aurelio", "Violin")
  
  >>>aure_musician.instrument = "Cello"
  ```

- However, we can not change the instrument since it is immutable, only define one initial

- Multiple Dispatch

  ```
  function introduceMe(person::Musician)
      println("Hello, my name is $(person.name) and I play $(person.instrument).")
  end
  
  >>>introduceMe(aure_musician)
  Hello, my name is Aurelio and I play Violin
  ```

- 

- https://techytok.com/lesson-types/

## Built in functions

- Print output without going to new line: 

  ```
  print()
  ```

- Print output and go to new line:

  ```
  println()
  ```

- Round to a certain amount of decimals or significant digits

  ```
  round(Value, digits = n) # can also specify base = N, eg. Value/N
  round(Value, sigdigits = n)
  ```


- Turn a string into another value:

  ```
  parse(type,string)
  ```

- Padding:

  ```
  lpad(Input, N, '0') # Here zero pad, N size and l for left, h for right
  ```


- Test Numbers: true or false

  ```
  isequal(x,y)
  isfinite(x)
  isinf(x)
  isnan(x)
  isinteger(x) # Check if 3.0 is the same as 3
  ```

  - Factorial and Big Int (largest int possible)

    ```
    factorial(BigInt(x))
    ```
  
  
  - Get array of unique entries
  
    ```
    unique(array)
    ```
  
    
  
  ## Ternary Operators
  
  - If else statement. If a statement true, then b, else c
  
    ```
    a ? b : c
    ```

## Plotting

### Normal 2D plot

- The ! is used to modify function

```
plot(x, y, label="sin(x)") 		# Plot y vs x
plot!(xlab="x", ylab="f(x)")	# Add labels
plot!(legend=:bottomleft)  		# Legend Position
savefig("img1c.png")			# Save figure in folder
```

- Some backend options:
- GR, quite new so lacking options: gr()
- Plotly, nice interactive plots, web based: plotly()
- Pyplot, use the python plotting tool, need to be setup

### Plot using Pyplot as default

- Added the following way

  ```julia
  using Pkg
  Pkg.add("PyPlot")
  using Plots
  pyplot()
  ```

- Can also add Latex options

  ```
  Pkg.add("LaTeXStrings")
  using LaTeXStrings
  ```

- Every function or property for matplotlib is available through `PyPlot.function_name`

## Integration

- Done using the QuadGK package: Which use Gauss-Konrad formula

  ```
  using Pkg
  Pkg.add("QuadGK")
  
  using QuadGK
  
  func1(x) = exp(-x^2)
  res, err = quadgk(func1, -Inf, Inf, rtol=1e-15)
  
  func2(x, y, z) = x + y^3 + sin(z) # Multiple variables
  x = 5							# Fix
  z = 3
  arg(y) = func2(x, y, z) 		# Make new Function
  
  #%%
  res, err = let x=5; z=3			# Same thing using let and local x,z
      arg(y) = func2(x, y, z)
      
      quadgk(arg, 1, 3)
  end
  ```

  ## Profiling (Time)
  
  
  
  ## Keyboard Shortcuts
  
  - Undo: Ctrl+z
  - Redo: Ctrl+y
  - Cut: Ctrl+x
  - Find: Ctrl+f
  - Replace: Ctrl+h
  - Jump word: Ctrl+Shift+pil
  - Comment out/undo: Ctrl+'
  - Mark next instance: Ctrl+d