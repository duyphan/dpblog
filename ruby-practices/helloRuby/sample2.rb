#!/usr/bin/ruby
a = [ 45, 3, 19, 8 ]
b = [ 'sam', 'max', 56, 98.9, 3, 10, 'jill' ]
print (a + b).join(' '), "\n"
print a[2], " ", b[4], " ", b[-2], "\n"
print a.sort.join(' '), "\n"
a << 57 << 9 << 'phil'
print "A: ", a.join(' '), "\n"
