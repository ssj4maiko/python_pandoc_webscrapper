#!/bin/bash
if [[ -e "html/$1.html" ]]; then
	echo "#!/bin/bash
	pandoc -t epub3 -o \"epub/$1.epub\" \"html/$1.html\"" > shell-run-for-pandoc.sh
	docker compose up pandoc
else
	echo "Arquivo `html/$1.html` não existe"
fi