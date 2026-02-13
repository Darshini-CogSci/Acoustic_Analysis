directory$ = "./users/data"
outputfile$ = "./users/data.xls"

fileappend 'outputfile$' "Filename'tab$'Label'tab$'Duration(ms)'tab$'F1_25(Hz)'tab$'F2_25(Hz)'tab$'F1_50(Hz)'tab$'F2_50(Hz)'tab$'F1_75(Hz)'tab$'F2_75(Hz)'newline$"

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
		label$ = Get label of interval... 1 i

		if label$ <> ""
			vowelstart = Get starting point... 1 i
			vowelend = Get end point... 1 i
			duration = (vowelend - vowelstart) * 1000

			# 25%, 50%, and 75% times for diphthong trajectory
			t25 = vowelstart + 0.25 * (vowelend - vowelstart)
			t50 = vowelstart + 0.50 * (vowelend - vowelstart)
			t75 = vowelstart + 0.75 * (vowelend - vowelstart)

			select Sound 'fileName$'
			To Formant (burg)... 0 5 5500 0.025 50

			# Get F1 and F2 at 25%, 50%, 75%
			f1_25 = Get value at time... 1 t25 Hertz Linear
			f2_25 = Get value at time... 2 t25 Hertz Linear
			f1_50 = Get value at time... 1 t50 Hertz Linear
			f2_50 = Get value at time... 2 t50 Hertz Linear
			f1_75 = Get value at time... 1 t75 Hertz Linear
			f2_75 = Get value at time... 2 t75 Hertz Linear

			fileappend 'outputfile$' 'fileName$''tab$''label$''tab$''duration:2''tab$''f1_25:2''tab$''f2_25:2''tab$''f1_50:2''tab$''f2_50:2''tab$''f1_75:2''tab$''f2_75:2''newline$'
		endif
	endfor

	select all
	minus Strings list
	Remove
endfor

select Strings list
Remove
