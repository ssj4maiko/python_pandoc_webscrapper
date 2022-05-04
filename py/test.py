from bs4 import BeautifulSoup, Doctype

doc = BeautifulSoup()
doc.append(Doctype('html'))

html = doc.new_tag('html', lang='en-US')
body = doc.new_tag('body')
html.append(body)

header = doc.new_tag('h1')
header.string = "Hello World"
body.append(header)

doc.append(html)

print(doc.prettify())