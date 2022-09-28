#%% Mini-Max Sum

# 5!/4! = 5 unique combinations

arr = [1, 2, 3, 4, 5] 				# Example

function miniMaxSum(arr)
	min_sum::Int64 = typemax(Int64) # Max
	max_sum::Int64 = 4				# Min is 4
	for i in 1:5					# 5 Different Combinations
		sum::Int64 = 0
		for j in 1:5				# Go through array
			if j != i				# Skip one index each time
				sum += arr[j]
			end
		end
		if sum < min_sum			# Need to separate because fist evaluation can be dodgy
			min_sum = sum
		end
		if sum > max_sum
			max_sum = sum
		end
	end
	print(min_sum, ' ', max_sum)
end

miniMaxSum(arr)

#%% Birthday Cake Candles

candles_count = 4 					# Example
candles = [3, 2, 1, 3]

function birthdayCakeCandles(candles)
    max_height = 0
    for candle in candles
        if candle > max_height
            max_height = candle
        end
    end
    num = 0
    for	candle in candles
		if candle == max_height
			num += 1
		end
	end
	return num
end

result = birthdayCakeCandles(candles)
print(result)

#%% Time Conversion
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.

s = "12:59:45AM" 					# Example

function timeConversion(s)
	format = s[end-1:end]
	hh = parse(Int32,s[1:2])
	mm = s[4:5]
	ss = s[7:8]

	if format == "PM"
		if hh + 12 < 24
			hh += 12
		end
	elseif format == "AM"
		if hh - 12 >= 0
			hh -= 12
		end 
		hh = lpad(hh, 2, '0')
	end
	time = "$hh:$mm:$ss"
	return time
end

result = timeConversion(s)

print(result)

#%% Grading Students
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY grades as parameter.

grades_count = 4		# Example

grades = [73, 67, 38, 33]

function gradingStudents(grades)
	for i in 1:grades_count
		rest = grades[i] % 5
		if grades[i] >= 38 && rest > 2
			grades[i] += 5 - rest
		end
	end
	return grades
end

result = gradingStudents(grades)

print(result)

#%% Apple and Orange
# The function accepts following parameters:
#  1. INTEGER s
#  2. INTEGER t
#  3. INTEGER a
#  4. INTEGER b
#  5. INTEGER_ARRAY apples
#  6. INTEGER_ARRAY oranges

s = 7

t = 11

a = 5

b = 15

m = 3

n = 2

apples = [-2, 2, 1]

oranges = [5, -6]

function countApplesAndOranges(s, t, a, b, apples, oranges)
	apples_inside = 0
	oranges_inside = 0
	apples .+= a					# Determine x-position
	oranges .+= b
	for apple in apples
		if s <= apple <= t
			apples_inside += 1
		end
	end
	for orange in oranges
		if s <= orange <= t
			oranges_inside += 1
		end
	end
	println(apples_inside)
	print(oranges_inside)
end

countApplesAndOranges(s, t, a, b, apples, oranges)

#%% Kangaroo
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. INTEGER x1
#  2. INTEGER v1
#  3. INTEGER x2
#  4. INTEGER v2

x1 = 0 # Example

v1 = 2

x2 = 5

v2 = 3

function kangaroo(x1, v1, x2, v2)
	result = "NO"
	zero_func(N) = x2 - x1 + (v2 - v1)*N		# Check if a zero exists
	for N in 1:1000
		if zero_func(N) == 0
			result = "YES"
			break
		end
	end
	return result
end

function kangaroo_alt(x1, v1, x2, v2)
	N = (x1 - x2)/(v2 - v1)
	isinteger(N) && N > 0 ? result = "YES" : result = "NO" # Check equality instead
	return result
end

result = kangaroo_alt(x1, v1, x2, v2)
print(result)

#%% GetTotalX
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY a
#  2. INTEGER_ARRAY b

n = 2 # Example

m = 3

arr = [2, 4]

brr = [16, 32, 96]

function getTotalX(a, b)
	Total = 0
	for X in a[end]:b[1]
		if iszero(broadcast(%, X, arr)) && iszero(b.%X)
			Total += 1
		end
	end
	return Total
end

total = getTotalX(arr, brr)

#%% breakingRecords
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY scores as parameter.

n = 10 				# Examples

scores = [3, 4, 21, 36, 10, 28, 35, 5, 24, 42]

function breakingRecords(scores)
	min_score = scores[1]
	max_score = scores[1]
	min_count = 0
	max_count = 0
	for score in scores
		if score < min_score
			min_count += 1
			min_score = score
		end
		if score > max_score
			max_count += 1
			max_score = score
		end
	end
	return [max_count, min_count]
end

result = breakingRecords(scores)

join(result, " ")

#%% birthday
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY s
#  2. INTEGER d
#  3. INTEGER m

n = 5 						# Example
s = [1, 2, 1, 3, 2]
d = 3
m = 2

function birthday(s, d, m)
	num_ways = 0
	for i = 1:n-m+1
		sum = 0
		for j = i:i+m-1
			sum += s[j]
		end
		if sum == d
			num_ways += 1
		end
	end
	return num_ways
end

result = birthday(s, d, m)

print(result)

#%% divisibleSumPairs

n = 6
k = 3
ar = [1, 3, 2, 6, 1, 2]

function divisibleSumPairs(n, k, ar)
	num_pairs = 0
	for i = 1:n-1
		for j = i+1:n
			if (ar[i] + ar[j]) % k == 0
				num_pairs += 1
			end 
		end
	end
	return num_pairs
end

result = divisibleSumPairs(n, k, ar)

print(result)

#%% migratoryBirds

arr_count = 6
arr = [1, 4, 4, 4, 5, 3]

function migratoryBirds(arr)
    sightings_type = 0
    sightings_max = 0
    for i = 1:5
        sightings_sum = 0
        for bird in arr
            if bird == i
                sightings_sum += 1
            end
        end       
        if sightings_sum > sightings_max
			sightings_max = sightings_sum
            sightings_type = i
        end
    end
    return sightings_type
end

result = migratoryBirds(arr)

print(result)

#%% dayOfProgrammer

year = 

function dayOfProgrammer(year)
	month = lpad(9, 2, '0')
	day = 13
	if year > 1918
		if year % 400 == 0 || year % 4 == 0 && year % 100 != 0
			day = 12
		end
	elseif year < 1918
		if year % 4 == 0 
			day = 12
		end
	else
		day = 26
	end
	return "$day.$month.$year"
end

result = dayOfProgrammer(year)

print(result)

#%% bonAppetit

n = 4

k = 1 + 1

bill = [3, 10, 2, 9]

b = 12

function bonAppetit(bill, k, b)
	sum = 0
	for i = 1:n
		if i != k
			sum += bill[i]
		end
	end
	b_actual = Int32(sum/2)
	if b_actual == b
		print("Bon Appetit")
	else
		print(b-b_actual)
	end
end

bonAppetit(bill, k, b)

#%% sockMerchant

# A = [10, 20, 20, 10, 10, 30, 50, 10, 20]
# B = [(count(==(i), A)) for i in unique(A)] # array of instances

function sockMerchant(n, ar)
	pairs = 0
	for unique_element in unique(ar)
		sum = 0
		for element in ar
			if unique_element == element
				sum += 1
			end
		end 
		while sum > 1
			pairs += 1
			sum -= 2
		end
	end
	return pairs
end

n = 9

ar = [10, 20, 20, 10, 10, 30, 50, 10, 20]

result = sockMerchant(n, ar)

print(result)

#%% pageCount

function pageCount(n, p)
	Halfceil = Int(ceil(n/2))
	Halffloor = Int(floor(n/2))
	flips = 0
	if p <= Halfceil && p <= Halffloor
	for i = 0:Halfceil
		if 1 + 2*i >= p	
			flips = i
			break
		end
	end
	else
		if n - p == 1 && n % 2 == 1
			flips = 0
			return flips
		end
		for i = 0:Halfceil
			if n - 2*i <= p + n % 2
				flips = i
				break
			end
		end
	end
	return flips
end

n = 4

p = 4

result = pageCount(n, p)

print(result)

#%% countingValleys

steps = 8
path = ['U','D','D','D','U','D','U','U']

function countingValleys(steps, path)
	Valleys = 0
	Alt = 0
	for step in path
		if step == 'U'
			Alt += 1
		elseif step == 'D'
			Alt -= 1
		end
		if Alt == 0 && step == 'U'
			Valleys += 1
		end
	end
	return Valleys
end

result = countingValleys(steps, path)

print(result)

#%% 

function reverseArray(a)
    for i in reverse(1:arr_count)
        print(a[i], " ")
    end
end

arr_count = 4

arr = [1, 4, 3, 2]

reverseArray(arr)

#%% hourglassSum

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