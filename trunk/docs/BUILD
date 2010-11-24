#################################################################################
##                                                                             ##
## BUILD File for the                                                          ##
##                      openSUSE Weekly News Project                           ##
##                                                                             ##
## Sascha Manns <saigkill@opensuse.org>                                        ##
## Thomas Schraitle <toms@suse.de>                                             ##
##                                                                             ##
## Last edit: $Date: 2010-11-24 20:30:55 +0100 (Mi, 24. Nov 2010) $            ##
##                                                                             ##
#################################################################################

1.) Introduction / Whats this project all about?
================================================
This file introduce you to the build process. As already written in the TUTORIAL
we use XML files for creating the openSUSE Weekly News. You learn in this process 
how you can use the XML files for creating your own book.

2.) Prequisites / What do I need?
=================================
For building the book, all you need to do is install the following packages
via zypper or YaST:
* susedoc
* susedoc-buildbook

## Maybe we should add how to find it? A URL? I'm not sure about susedoc-buildbook
## as this is primarily Karl's baby. :)
The susedoc package contains lots of dependencies to other packages. Usually we
need all of them. The installer take care of resolving all dependencies.


3.) Build / How do I build a book?
==================================
Go to your language folder (trunk/en) and start the file "chooser.py":

$ python chooser.py

This command displays a list of possible output formats. Depending what
output have been selected, the chooser.py script runs other scripts for
the actual transformation task. For example, if you have selected "PDF",
chooser.py executes "own2pdf.sh" to build the PDF. Similar for the 
other output formats.

To create output formats from DocBook involves usually the following steps,
which are implemented in the several "own2*.sh" scripts:
1. The XML validator "xmllint" looks for errors. This step is called "validation".
   If everything is ok, "valid" is printed. However, if you accidently 
   inserted a syntax  error in your file, the complete process stops here.
   Only valid files can be transformed. Fix your errors to make your 
   validator happy. :)
2. The XSLT processor "xsltproc" or "Saxon" collects all XML files and
   transforms it into the output format. This is done with the help of the 
   DocBook XSL stylesheets.  
3. The last step depens on the output format. In case of (X)HTML, you can read
   it directly in your browser. If you have selected PDF, a further step 
   formats the intermediate FO file into PDF.


4.) Participate / How to participate?
=====================================


