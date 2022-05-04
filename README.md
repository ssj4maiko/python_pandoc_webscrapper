# python_pandoc_webscrapper

Running python scripts (not included), converting html files to Pandoc using Docker

## Install

```
docker compose build
```
Python requirements can be configured in the Dockerfile, right now the main requirement for webscrapping is  BeautifulSoup4, if you need anything else, configure as needed.

## How to use

### From python
Create your python script in the `py` folder. The idea is for you to print HTML, which will then be converted by Pandoc.

An example is given through the `py/test.py` script, you then have to add the webscrapper logic as you see fit.
```sh
./python.sh 'filename'
```

The result will be in the `epub` folder, under the same name of the file.

### From Ready-made HTML file
If you already have an HTML file that you made in another way, just put it in the `html` folder, and run the command below.
```sh
./pandoc.sh 'filename'
```

The result will be in the `epub` folder, under the same name of the file.

### Logic
Instead of having to install all the requirements in different machines, with this method I can just use docker instead, which makes it more plataform independant. However because Docker requires an static command to run, I'm using shellscript to deal with that.

1. Check if the `{filename}`(.py) you gave exists, and writes a script called `shell-run-for-python.sh` which will then be run by the Docker container for python.
2. The script must write the whole HTML in the output, which the shellscript itself will forward to an `html\{filename}.html` file.
3. Runs the `pandoc.sh` script under the same rules, creating a script `shell-run-for-pandoc.sh` which will then convert the HTML file to `epub\{filename}.epub`

If you already have the HTML, you start from step 3.

## Testing

I'm not a python programmer (just did out of necessity), so I'm unsure how things are usually done professionally. So I made the `test-python.sh` to see how things return. Of course, most Linux systems (Or Windows under WSL2) have Python3 natively, so in that regard, you should be able to debug it natively.

All of what the scripts do are to ease and organize a way to run the scripts and convert files going from script to epub.

Some websites have protections, so you may need another solution (front-end), where you will aim for a straight HTML response, you then save that into a file and just use the 2nd part of this script to convert into an EPUB.

Of course, you are welcome to change the types of files you want to convert FROM *and* TO via the scripts