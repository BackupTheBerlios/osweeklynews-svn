#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Weekly News Output Chooser
# Version: 0.0.1
# (c) 2010 by Sascha Manns <saigkill@opensuse.org>
#
import sys
import subprocess

try:
	import dialog
except ImportError, e:
	print >> sys.stderr, "ERROR: %s\nSolution: Install the python-dialog package" % e
	sys.exit(10)

# Dialogbox initialisieren
d = dialog.Dialog(dialog="dialog")

# Menübox erzeugen
while 1:
	(code, tag) = d.menu(
			"Select output format",
			width=60,
			choices=[("PDF", "compiles and builds a PDF File"),
				 ("HTML", "compiles and builds a HTML File"),
				 ("Mediawiki", "compiles and builds a Mediawiki Output"),
				 ("EPUB", "compiles and builds a EPUB Output")]) 
	if code in (d.DIALOG_CANCEL, d.DIALOG_ESC):
		break
	if code == d.DIALOG_OK:
		d.msgbox("selected option:" + tag)
	        if tag == "PDF":
			d.msgbox("execute: %s" % "./own2pdf.sh")
			ret = subprocess.call("./own2pdf.sh", shell=True)
		if tag == "HTML":
			d.msgbox("execute: %s" % "./own2xhtml-single.sh")
			ret = subprocess.call("./own2xhtml-single.sh",
					      shell=True)
		break

# Programm ohne Fehler beenden
sys.exit(0)

