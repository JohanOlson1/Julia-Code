#%%
using Pkg
Pkg.add("Profile")

#%% Profiling


function take_a_breath()
    sleep(0.2)
    return
end

function test8()
    r=zeros(100,100)
    take_a_breath()
    for i in 1:100
        A=rand(100,100)
        r+=A
    end
    return r
end

using Profile
test8()
Profile.clear()
@profile test8()
Profile.print()

test8()
@profview test8()

#%% Benchmarking
using Pkg
Pkg.add("BenchmarkTools")
#%%
using BenchmarkTools

n = 10000000

function estimate_pi(n)
    n_circle = 0
    for i in 1:n
        x = 2*rand() - 1
        y = 2*rand() - 1
        if sqrt(x^2 + y^2) <= 1
           n_circle += 1
        end
    end
    return 4*n_circle/n
end

Matrix = ones(100,100)
function estimate_row_column(M, n)
    sum = 0
    for i = 1:100
        for j = 1:100
            sum += M[i,j]
        end
    end
end

@benchmark estimate_row_column(Matrix,n)