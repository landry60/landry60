Sphinx
======

Am Anfang (ca. 2002) war die Markup Sprache *reStructuredText* (reST). Das war
eine Idee aus der Welt der Programmiersprache *Python*, um Dokumentation zu
schreiben, die automatisch mit Hilfe von Umwandlungsprogrammen in
Ausgabeformate wie HTML und PDF umgewandelt werden kann. Die Programme sind im
Linux Paket ``docutils`` enthalten, man installiert sie mit ``apt install
python3-docutils`` (es ist immer Python3 zu bevorzugen, da Python 2 im Jahr
2020 eingestellt wird).  Wenn man eine Textdatei ``text.rst`` mit
reStructuredText (Endung ``.rst``) geschrieben hat, dann wandelt man diese nach
HTML um mit dem Kommando:

.. code-block:: bash

   rst2html text.rst text.html

.. index:: rst2html, docutils, reStructuredText

Die Homepage der "docutils" ist hier http://docutils.sourceforge.net/rst.html.

Mit dem Text *Quick reStructuredText* kann man sich schnell einen 
Überblick über die wichtigsten Markup Befehle verschaffen:

   http://docutils.sourceforge.net/docs/user/rst/quickref.html

Eine wichtige Eigenschaft von reST ist seine Erweiterbarkeit. Neue
Markup-Befehle können einfach definiert werden.


Das *Sphinx* Projekt hat diese Erweiterbarkeit genutzt und reST zu einer
kompletten Textverarbeitung weiterentwickelt, mit der man beliebige Dokumente
erstellen kann.

.. index:: Sphinx

.. figure:: img/sphinx-logo.png
   :align: center

   Die Homepage von Sphinx ist http://sphinx-doc.org

Sphinx gibt es auf Ihrem Linux-Rechner als Paket ``python3-sphinx``.

Um eine Dokumentationsprojekt zu beginnen, legt man ein neues 
Unterverzeichnis an, z.B. ``dva-bericht``, und ruft darin das 
Programm ``sphinx-quickstart`` auf.  Nach ein paar ja/nein Abfragen (siehe `Log
<_static/sphinx-quickstart-log.txt>`_) wird dadurch das Gerüst einer neuen
Dokumentation generiert. Danach sind in dem Verzeichnis folgende Dateien:

.. index:: sphinx-quickstart

::

   dva-bericht/
      conf.py      <-- Konfiguration fuer Sphinx
      index.rst    <-- Die Hauptseite
      make.bat     <-- Zum Bauen der Doku unter Windows
      Makefile     <-- Zum Bauen der Doku unter Linux
      _static      <-- Hilfsverzeichnis, kann man ignorieren
      _templates   <-- Hilfsverzeichnis, kann man ignorieren


Mit ``sphinx-quickstart`` kann man auch herausfinden, welche Version
von Sphinx man installiert hat, auf meinem Rechner erhalte ich folgende 
Ausgabe (die Version kann bei Euch eine andere sein):

.. code-block:: bash

   $ sphinx-quickstart --version
   sphinx-quickstart 2.2.0

Man sollte unter einer halbwegs aktuellen Version arbeiten, also z.B. 
1.8.x oder 2.x.

.. index:: make, make.bat

Die "richtige" Dokumentation in einem bestimmten Format muss erst erzeugt 
werden. Wenn man z.B. nach HTML ausgeben möchte, muss man eingeben:
``make html``.  Wenn man ``make`` ohne Option eingibt, bekommt man eine
Liste aller Formate. Darunter sind html, latex, epub, man, texinfo, 
text, xml und viele weitere. Die erzeugten HTML Dateien findet man 
in ``_build/html``.  Zum Betrachten ruft man einen Web-Browser 
wie folgt auf::

   firefox _build/html/index.html

.. index:: firefox, latex, epub, Version (Sphinx)


Sollte das Dokument aus mehren Dateien bestehen, dann werden diese in 
``index.rst`` inkludiert. Dieser Text besteht z.B. aus folgenden ``.rst``
Dateien: ``index.rst``, ``schreibtipps.rst``, ``sphinx.rst`` und
``werkzeuge.rst``. Zum Inkludieren werden die drei Dateien ohne ``.rst``
Endung in ``index.rst`` aufgenommen:

::

   .. toctree::
      :maxdepth: 2
      :numbered:     <-- die Abschnitte werden nummeriert

      intro          <--- intro.rst
      sphinx         
      schreibtipps   
      werkzeuge      
      anpassen
      schluss

.. index:: toctree


.. _ueberschrift:

Überschriften
-------------

.. index:: Überschriften

Die Überschriften kann man in verschiedenen Ebenen anlegen:

::

   Ebene 1    <== Grosse Ueberschrift am Anfang in jeder .rst Datei
   =======

   Ebene 2    
   -------

   Ebene 3
   ```````

   Ebene 4
   .......

Test Ebene 3
````````````

Die Nummerierung sollte 2.1.1 sein.

Test Ebene 4
............

Die Nummerierung sollte 2.1.1.1 sein.  Mehr Ebenen braucht man nicht!


Querverweise
------------

Man kann ganz einfach auf andere Abschnitte verweisen, wenn man vor dem
Abschnitt mit::

   .. _xyz:
   
ein "Label" setzt.  In diesem Fall hat das Label den Namen ``xyz``.  Vor den
obigen Abschnitt "Überschriften" habe ich das Label::


   .. _ueberschriften:
   
gesetzt, somit kann ich nun auf diesen Abschnitt mit 
``:numref:`ueberschrift``` verweisen, der Link geht dann zu
:numref:`ueberschrift`.

Ein anderer Link: In :numref:`formeln` kann man nachlesen, wie man Formeln in
Sphinx schreibt.  Das wurde gemacht durch ``:numref:`formeln```.



Ein wenig Markup
----------------

.. index:: Markup (Sphinx)

In Sphinx wird der in *reStructuredText* definierte Markup verwendet, plus
zusätzlicher Markup, der nur in Sphinx existiert.  Hier sind ein paar 
Beispiele:

Wörter können in verschiedenen Schriftarten geschrieben werden:
**fett**, *kursiv*, ``Schreibmaschine``.

Immer gut zu gebrauchen sind Postenlisten oder Aufzählungslisten:

* Mikroprozessoren 

  - STM32L476
  - AVR Mega32U4

* Spannungsregler 

  - 78L05

* Widerstände

  - 470 Ω
  - 2,2 kΩ

Bei den Listen immer aufpassen, dass vor dem Beginn einer neuen 
Einrückung eine Leerzeile gemacht wird.


Eine Aufzählung:

1. Aufstehen
#. Zähne putzen
#. Frühstücken



Wie man in der .rst Datei sieht, kann man ab dem zweiten Punkt die Zahl 
weglassen und stattdessen einfach ``#.`` schreiben.


Sehr vielseitig zu verwenden sind auch Code-Blöcke. Das sind Abschnitte, die 
in "Computerschrift" gesetzt werden. Ein Beispiel:

.. code-block:: text

   Zeile 1
   Zeile 2
   Zeile 3

In der .rst Datei habe ich dazu geschrieben:

.. code-block:: text

   .. code-block:: text
      Zeile 1
      Zeile 2
      Zeile 3

Die Angabe hinter ``code-block::`` bestimmt die Syntax, in der der 
folgende Abschnitt hervorgehoben wird. Mit ``text`` erfolgt keine 
Hervorhebung.  Andere Möglichkeiten sind hier z.B. ``c``, ``python``, 
``java``, ``bash`` und so weiter.

Hier sind ein paar Beispiele:

.. code-block:: c

   /* c */
   int main()
   {
       printf("Hello World\n");
       return 0;
   }

----

.. code-block:: python

   # python
   L = []
   for i in range(10):
      L.append(i)
      print(i)

----

.. code-block:: bash

   # bash 
   if [ -f "/home/hhoegl/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/hhoegl/miniconda3/etc/profile.d/conda.sh"  
        CONDA_CHANGEPS1=false conda activate base
    else
        export PATH="/home/hhoegl/miniconda3/bin:$PATH"
    fi


----


Kommentare schreibt man in die .rst Dateien wie folgt:

.. code-block:: text

   .. Das ist ein Kommentar. Es erfolgt 
      keine Ausgabe. 



Alles weitere kann man der Sphinx Homepage ([SPHINX]_) 
oder einem guten Tutorial entnehmen, z.B. [SPHTUT]_.

.. index:: Tutorial (Sphinx)



.. _sourcecode:

Programmtexte
-------------

.. index:: Sourcecode

Häufig müssen Sie Quelltextabschnitte in die Dokumentation aufnehmen. Sie 
können die Code-Blöcke entweder direkt in die .rst Datei aufnehmen oder
aus einer Datei lesen:

Hier ist ein Beispiel für einen Codeabschnitt in Python. Man kann einen 
Codeabschnitt auch mit einer Über- bzw. Unterschrift versehen ("caption") und 
eine Referenz drauf setzen mit "numref" (siehe :numref:`pydemo`):

.. code-block:: python
   :caption: "Hello World" in Python
   :name: pydemo

   # hallo.py
   def hallo():
       print("Hallo Welt")
   hallo()

und hier ist ein Abschnitt in C.  Die Zeilennummern werden durch ``:linenos:``
aktiviert.  Man kann auch den Beginn und die Schrittweite der Zeilennummern
einstellen.

.. index:: C, Python

.. code-block:: c
   :linenos:

   /* hallo.c */
   #include <stdio.h>

   int main()
   {
       printf("Hallo Welt\n");
       return(0);
   }
   
Wenn man den Quelltext aus einer Datei lesen möchte, dann geht das so (siehe
die Datei ``serial.c``): 

::

   .. literalinclude:: serial.c
      :caption: C Code zum Ansprechen der seriellen Schnittstelle
      :name: serialcode
      :language: c
      :linenos:

.. index:: literalinclude

Hier ist die Ausgabe:

.. literalinclude:: serial.c
   :caption: C Code zum Ansprechen der seriellen Schnittstelle
   :name: serialcode
   :language: c
   :linenos:

Auch bei ``literalcode`` kann man eine Bildüberschrift setzen und eine Referenz
angeben mit ``numref`` (siehe :numref:`serialcode`).

Nun noch ein Beispiel, das zeigt, wie Sie einen *Link* auf eine Quelltextdatei
setzen. Im Verzeichnis ``sphinxbericht`` gibt es die Datei ``hello_world.py``. 
Es funktioniert nicht, wenn man die Datei im aktuellen Verzeichnis verlinkt:

* `<hello_world.py>`_  (Link existiert nicht)

Der Grund ist, dass die Quelltextdatei nicht in den Ausgabeordner ``_build/html``
kopiert wird.

Die Datei sollte in den Ordner ``_static`` kopiert werden, dieser Ordner wird
komplett in das Ausgabeverzeichnis kopiert.

* `<_static/hello_world.py>`_  (Link existiert)




.. _formeln:

Formeln schreiben
-----------------

.. index:: Formeln

Formeln schreiben ist in Sphinx einfach: Man verwendet die gleiche Syntax wie
in Latex!

Beispiel (Pythagoras): :math:`a^2 + b^2 = c^2`.

Die folgende Formel 

.. math::
   :name: formel1

   (a + b)^2 = a^2 + 2ab + b^2

   (a - b)^2 = a^2 - 2ab + b^2

wird so geschrieben::

   .. math::
 
      (a + b)^2 = a^2 + 2ab + b^2

      (a - b)^2 = a^2 - 2ab + b^2


Damit man ``math`` verwenden kann, muss man die Sphinx Erweiterung
``sphinx.ext.mathjax`` in die Variable ``extensions`` in ``conf.py`` aufnehmen.



.. _lit:

Literatur
---------

.. [SPHINX] Die Sphinx Homepage (besucht am 5.10.2019): 
   https://www.sphinx-doc.org

.. [SPHTUT] Thomas Cokelaer, Sphinx and RST syntax guide, 2014 (besucht am
   5.10.2019)
   https://thomas-cokelaer.info/tutorials/sphinx/rest_syntax.html


.. vim: et sw=3 ts=3
