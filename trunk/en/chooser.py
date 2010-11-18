#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Weekly News Output Chooser
# Version: 0.0.1
# (c) 2010 by Sascha Manns <saigkill@opensuse.org>
#
import dialog, time, sys

# Dialogbox initialisieren
d = dialog.Dialog(dialog="dialog")

# Menübox erzeugen
while 1:
	(code, tag) = d.menu(
			"Which Outputformat you want?",
			width=60,
			choices=[("PDF", "compiles and builds a PDF File"),
				 ("HTML", "compiles and builds a HTML File"),
				 ("Mediawiki", "compiles and builds a Mediawiki Output"),
				 ("EPUB", "compiles and builds a EPUB Output")]) 
			if code in (d.DIALOG_CANCEL, d.DIALOG_ESC):
				break
			if code == d.DIALOG_OK:
				d.msgbox("Your choosed option:" + tag)
				break

# Programm ohne Fehler beenden
sys.exit(0)

