directory$ ="./users/data"
outputFile$ = "./users/data.xls"
filedelete 'outputFile$'
fileappend 'outputFile$' "Filename'tab$'Label'tab$'Duration(ms)'newline$'"

Create Strings as file list... list 'directory$'\*.wav
numberOfFiles = Get number of strings

for ifile to numberOfFiles
    select Strings list
    fileName$ = Get string... ifile
    fileName$ = selected$("Sound")
    Read from file... 'directory$'\'fileName$'.TextGrid

    select TextGrid 'fileName$'
    n = Get number of intervals... 1

    for i from 1 to n
        label$ = Get label of interval... 1 i
        if label$ <> ""
            votstart = Get starting point... 1 i
            votend = Get end point... 1 i
            duration = (votend - votstart) * 1000

            fileappend 'outputFile$' 'fileName$''tab$''label$''tab$''duration:2''newline$'
        endif
    endfor

    select all
    minus Strings list
    Remove
endfor

select Strings list
Remove