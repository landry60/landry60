
Anleitung "Berichte mit Sphinx schreiben"
-----------------------------------------

Hubert Högl, <Hubert.Hoegl@hs-augsburg.de>, 2017, 2018, 2019

URL: https://r-n-d.informatik.hs-augsburg.de:8080/hubert.hoegl/sphinxbericht.git

Dieser Text ist eine Anleitung, wie man Berichte (nicht nur) in der 
technischen Informatik mit [Sphinx](http://sphinx-doc.org) schreiben kann.

Damit Sie diese Anleitung mit Sphinx nach HTML übersetzen können, muss Sphinx
installiert sein:

```
sudo apt install python3-sphinx
```

oder über pip (für Python 3!) mit

```
sudo pip install -U sphinx
```

Man wandelt den Rohtext nach HTML um mit

```
make html
```

Danach kann man den Text betrachten mit 

```
firefox _build/html/index.html
```

Der Bericht ist im HTML Format an diesem Ort

http://hhoegl.informatik.hs-augsburg.de/dva/sphinxbericht

oder auf dem RZ Server:

https://www.hs-augsburg.de/~hhoegl/sphinxbericht

Zum Übertragen der HTML Dateien auf einen anderen Rechner kann man ``rsync`` 
verwenden, ähnlich folgender Kommandozeile

```
  rsync -zav --delete _build/html/ login.rz.hs-augsburg.de:/www/$USER/sphinxbericht/
```

``$USER`` ist Ihre RZ-Kennung.


