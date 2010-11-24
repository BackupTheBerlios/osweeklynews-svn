#################################################################################
##                                                                             ##
## BUILD File for the                                                          ##
##                      openSUSE Weekly News Project                           ##
##                                                                             ##
## Sascha Manns <saigkill@opensuse.org>                                        ##
## Thomas Schraitle <toms@suse.de>                                             ##
##                                                                             ##
## Last edit: $Date: 2010-11-24 16:08:51 +0100 (Mi, 24. Nov 2010) $            ##
##                                                                             ##
#################################################################################

For this step we need two special package from the Build Service.
You need the packages "susedoc" & "susedoc-buildbook". Both packages
have depencies to other needed packages like fop. That's ok. We
need all of this.

In the next Step you can start chooser.py with:

$ python chooser.py

If you select "PDF" the Program runs a Script called "own2pdf". In case of 
selection "HTML" the Program uses the Script "own2xhtml-single".

The next lines are a example of using "PDF".
If i select PDF the script starts. First of all the parser checks, if the
XML-File is valid. If the result is "not valid" you have to check the XML File.
Most are little errors like a unclosed tag like </html>.
By getting "valid" all is ok.

Then starting some subprograms like FOP and they trying to read all settings
from /xslt/fo. Now the Programm read all XML Files under /xml. Then the 
Program applies the Layout from xslt to the xml Files, and generates a Output.

In this case we have a Output called "OWN.pdf". Using other Parameter like
HTML you get a "OWN.html".

That file you can distribute on every place.

#### Rework ####
1.) Introduction / Whats this project all about?
================================================


2.) Prequisites / What do I need?
=================================


3.) Build / How do I build a book?
==================================

4.) Participate / How to participate?
=====================================


