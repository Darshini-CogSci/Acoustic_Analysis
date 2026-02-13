directory$="./users/data"
fileappend ./users/data.xls Filename'tab$'label 'tab$' Duration'tab$'F1(bark)'tab$'F2(bark)'tab$'F1(hz)'tab$'F2(hz)'tab$'F3(hz)'tab$'F1(m)'tab$'F2(m)'tab$''newline$'
Create Strings as file list... list 'directory$'\*.wav
numberOfFiles = Get number of strings
for ifile to numberOfFiles
select Strings list
fileName$ = Get string... ifile
Read from file... 'directory$'\'fileName$'
fileName$ = selected$("Sound")
Read from file... 'directory$'\'fileName$'.TextGrid
select Sound 'fileName$'
plus TextGrid 'fileName$'
Clone time domain
Read from file... 'directory$'\'fileName$'.TextGrid
n = Get number of intervals... 1
for i from 1 to n
select TextGrid 'fileName$'
label$=Get label of interval... 1 i
if label$ <> ""
vowelstart=Get starting point... 1 i
vowelend=Get end point... 1 i
vowelmid= (vowelstart+vowelend)/2
duration=(vowelend-vowelstart)*1000
select Sound 'fileName$'
To Formant (burg)... 0  5  5500  0.025  50
f1b = Get value at time... 1 vowelmid Bark Linear
f2b = Get value at time... 2 vowelmid Bark Linear
f1h = Get value at time... 1 vowelmid Hertz Linear
f2h = Get value at time... 2 vowelmid Hertz Linear
f3h = Get value at time... 3 vowelmid Hertz Linear
f1m = hertzToMel(f1h)
f2m = hertzToMel(f2h)
fileappend ./users/data.xls 'fileName$''tab$''label$''tab$''duration:2''tab$''f1b:2''tab$''f2b:2''tab$''f1h:2''tab$''f2h:2''tab$''f3h:2''tab$''f1m:2''tab$''f2m:2''newline$'
endif
endfor
select all
minus Strings list
Remove
endfor
select Strings list
Remove
