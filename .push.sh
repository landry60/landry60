rsync -zav --delete -e "ssh -p 2222" _build/html/ hhoegl.informatik.hs-augsburg.de:data/www/dva/sphinxbericht/
rsync -zav --delete _build/html/ hhoegl@login.rz.hs-augsburg.de:/www/hhoegl/sphinxbericht/
