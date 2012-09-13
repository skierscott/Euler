import math
import pdb
import itertools
import time
def factorial(n):
    if n==1:# or n==0:
        return 1
    if n == 0:
        return 0
    else:
        return n* factorial(n-1)

def digits(n):
    return int(math.log10(n) + 1)


def find(n, search):
    x = 0
    # assumes n in a string
    for i in range(0,len(n)):
        if n[i] == str(search):
            x += 1 
    return x

def a34():
    # find all digits where it equals the factorial
    # ie, 145 = 1! + 4! + 5! = 1+ 24 + 120 = 145
    x = 0
    list = []
    for y in range(4, int(1e8)):
        total_fact = 0
        if y % 1e6 == 0:
            print y, x 

        for i in range(0,digits(1.0*y)):
            total_fact += factorial(int(str(y)[i]))

        if y == total_fact:
            list.append(y)
            x += 1
    print x
    print list



def a24():
    # find the millionth lexographic permutation of
    # 0,1,2,3,4,5,6,7,8,9

    # start out with lowest number, increasing the next number
    x = []
    i = 0
    for perm in itertools.permutations([0,1,2,3,4,5,6,7,8,9]):
        i += 1
        x.append(perm)

        if i % (1e6  +1)== 0:
            print perm, i
            print x[int(1e6) - 1]
#   x = itertools.permutations([0,1,2,3,4,5,6,7,8,9])
#   print x[int(1e6+1)]

def convert_char(old):  
    if len(old) != 1:
            return 0
    new = ord(old)
    if 65 <= new <= 90:
       # Upper case letter    
       return new - 64
    elif 97 <= new <= 122:
        # Lower case letter
        return new - 96  # Unrecognized character
    return 0

def a21():
    # find the sum of scores in a file of names. scott = 5th name. scott =  (20 + 3...) * 5
    k = 0
    file = open('names.txt')
    sum = 0

    for name in file.readlines():
        k += 1
        score = 0
        name = name[:-1]
        for j in range(0,len(name)):
            score += convert_char(name[j])
        sum += score * k
    print sum
    return sum

def sum_of_digits(n):
    sum = 0
    n = str(n)
    for i in range(0,len(n)):
        sum += int(n[i])
    return sum

def p56():
    # what is the sum of digits in a^b. ie, 100^100 = 1000... 
    # sum of digits = 1
    max = 0
    start = time.time()
    for a in range(1,101):
        for b in range(1,101):
            x = sum_of_digits(a^b)
            if x > max:
                max = x
    end = time.time()
    print max, end - start


def find_minimal(D):
    # find minimal solution for x^2 - D*y^2 == 1
    min_x, min_y = oo, oo
   #pdb.set_trace()
    y = 1
    start = time.time()
    for y in range(1, D^2 + 150):
        x = var('x')
        x = solve(x^2 - D*y^2 == 1, x)[1].rhs()
        if (x+y).n() < min_x + min_y and x.n()%1 == 0: 
            min_x, min_y = x,y
    end   = time.time()
    return min_x, min_y, end-start


def p66():
    # x^2 - D*y^2 == 1
    # given D, find a minimal solution for that equation. ie, 9^2 - 5*4^2 == 1
    # what is the largest value of x for D <= 1000?
    # Project Euler 66
    max = 0
    for D in range(1,1000+1):
        x = find_minimal(D)
        if x > max:
            max = x
            print max
    










