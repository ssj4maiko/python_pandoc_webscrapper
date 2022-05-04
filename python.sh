#!/bin/bash
if [[ -e "py/$1.py" ]]; then
	echo "#!/bin/python3
	python3 py/$1.py > html/$1.html" > shell-run-for-python.sh
	docker compose up python
	bash pandoc.sh ${1}
else
	echo "Arquivo \`py/$1.py\` não existe"
fi