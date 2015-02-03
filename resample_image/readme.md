Suppose I have a legacy data file that consists of 1's and 0's, like this:

00000000
00001100
00011110
00111110
00010110
00001000

(except it's much larger - probably 80x80).  I want to convert it to a black-and-white image, using a 4x4 patch of white pixels for each 0 and an equivalent patch of black pixels for each 1.  What's the simplest way to do that in R (by which I mean, what would we show novices)?
