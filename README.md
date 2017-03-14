# svnLogToGitLog


This lua  programm can be used to convert some svn logs to  git logs.
These logs are generated in the form that the löve programm LoGiVi can use and show them.


To start using it simply put the to be converted file in the same folder, change the name of the file to be read in the converter script and then run it :)

If you have any suggestions / Ideas or found any bugs just submit a Issue and I will check what I could do :)


### How do I get the log file ?
you can get these kind of log files if you go to your svn repository and use the following command on the command line:
```
svn log -v -r1:HEAD >logfile.log
```
Actually I tested it with tortoise svn but I gues it should work with others to if they have the same or verry similar log file formats




### What should be the input ?

you should input a log file which loks like that:
```
--------------------------------------------------------------------------
r1 | max.mustermann | 2011-11-11 11:11:11 +0100 (Fr, 11 Nov 2011) | 1 line
Changed paths:
  A /folder/file.txt
  A /text.txt
  M /abc.text

Added some things / modified others
--------------------------------------------------------------------------
r2 | betti.beispiel | 2011-11-11 11:11:12 +0100 (Fr, 11 Nov 2011) | 1 line
Changed paths:
  A /folder/other_file.txt
  A /test.txt
  M /abc.text
  D /text.txt

Added some things / modified others / deleted this and that
--------------------------------------------------------------------------
```



### What do I get as output ?

You will get something similar looking like this :
```
info: max.mustermann|max.mustermann@xyz.com|1321009871
A folder/file.txt
A text.txt
A abc.text

info: betti.beispiel |betti.beispiel@xyz.com|1321009931
A folder/other_file.txt
A test.txt
M abc.text
D text.txt

```


