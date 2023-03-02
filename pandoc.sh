#!/bin/bash
if [[ -e "html/$1.html" ]]; then
	echo "#!/bin/bash
	pandoc -t epub3 -o \"epub/$1.epub\" \"html/$1.html\"
	mv \"html/$1.html\" \"html_finished/$1.html\"" > scripts/shell-run-for-pandoc.sh
	docker compose up pandoc
else
	echo "File 'html/$1.html' does not exists"
fi