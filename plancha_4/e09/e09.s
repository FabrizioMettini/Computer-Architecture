@ Problem Set 04 - Exercise 09

@ Implement the russian peasant multiplication algorithm

@ Register Usage
@ r0: i		(unsigned int)
@ r1: j		(unsigned int)
@ r2: res	(unsigned int)

.text
.global russian_peasant
russian_peasant:
	mov r2, #0          @ res = 0

loop:
	cmp r1, #1          @ (j > 1) ?
	
	addls r0, r0, r2    @ if not, make the return value equals to res + i
	bxls lr             @ ... and return
	
	tst r1, #1          @ (j & 1) ?
	
	@ if true (j odd)
	addne r2, r0        @ res += i
	subne r1, #1        @ j -= 1
	
	@ else (j even)
	lsleq r0, r0, #1    @ i *= 2
	lsreq r1, r1, #1    @ j /= 2
	
	b loop              @ go to the next iteration

