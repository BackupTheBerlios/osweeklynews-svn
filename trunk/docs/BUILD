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
This file tries to introduce you for the Buildprocess from our XML Files.
As already written in the TUTORIAL we using XML Files for making the 
openSUSE Weekly News. This experiences you learn in this Process you can use
later for making own Documentations or Books. Or you can rework present openSUSE
Documentations.

2.) Prequisites / What do I need?
=================================
For the Building process we use the following packages:
* susedoc
* susedoc-buildbook

In normal cases these two packages are putting other packages to your Install list.
This is no problem, we need all of them.

If all is installed you need no more and you can go to the next step.

3.) Build / How do I build a book?
==================================
In your Languagefolder (like trunk/en) you find a File called "chooser.py".
Please start this via:

$ python chooser.py

Then comes a little GUI who asks you which Outputformat you want. At the 
Moment just "PDF" works. The rest is WIP. In case you choose "PDF" the chooser
starts the Script "own2pdf.sh". And then you get a File called "OWN.pdf".
If you have selected "HTML" then the chooser calls the script "own2xhtml.sh" and then
you get the Output "OWN.html".

Than you're ready.

If you want to know what happens behind the Wall, i'd like to introduce you a little
bit.
The first thing what happens is, that a program called "xmllint" looks for Errors in
the XML file. If that are ok, the Program says "valid". Otherwise we get an Error.
The next called Program is "xsltproc". That Program collects all XML Files and put it 
in one File. This File now are formatted with our Stylesheets in our xslt Folder (like 
trunk/en/xslt/fo). The Outputfile is in XSLT-FO Format. The last Process calls "fo" 
The FO Processor now generates our wished Outputformat (like PDF) and we're getting
"OWN.pdf" or "OWN.html".

4.) Participate / How to participate?
=====================================


