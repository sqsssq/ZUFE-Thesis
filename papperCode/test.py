a=int(input('输入数字1:'))
b=int(input('输入数字2:'))
s=a*b
while a%b!=0:
    a,b=b,(a%b)
    print(a)
    print(b)
else:
    print(b,'is the maximum common divisor最大公约数')
    print(s//b,'is the least common multiple，最小公倍数')