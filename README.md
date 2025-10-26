# Welcome
>  for the first use of my template, you should follow the next steps.

## Step 1: Install toolkit
* [Pandoc](https://pandoc.org/installing.html)
<font color="red">!</font> For the newest version, you should follow the link beyond.
```bash
sudo apt update
wget https://github.com/jgm/pandoc/releases/download/3.8.2.1/pandoc-3.8.2.1-1-amd64.deb
sudo dpkg -i pandoc-3.8.2.1-1-amd64.deb
pandoc --version 
```
If you see similar output below, you have installed the pandoc successfully.
```bash
pandoc 3.8.2.1
Compiled with pandoc-types 1.22, texmath 0.12.0.1, skylighting 0.11.0.1
```
* [Latex](https://www.latex-project.org/get/)
The installation of Latex maybe a llite difficult, you can follow the commands below, or you can click the link beyond and seek help from ChatGpt.
```bash
cd /tmp
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf - # note final - on that command line
cd install-tl-2*
perl ./install-tl --no-interaction
```
Finally, prepend /usr/local/texlive/YYYY/bin/PLATFORM to your PATH,
e.g., /usr/local/texlive/2025/bin/x86_64-linux

## Step 2: Write your markdown file 
* maybe you can use my finding-layout.md or use yours

## Step 3: Custom my content.md with your details, like your name, your_log.pdf,et.

```markdown
---
title: "Your report name" #需替换
author: "Your name" #需替换
date: "date" #需替换
cover: "your_logo.pdf" #需替换    
titlepage: true      
---
```

## Step 4: Execute the follow commands in your shell
```
pandoc content.md \
  --from markdown \
  --to pdf \
  --template=template.tex \
  --output=audit-report.pdf \
  --pdf-engine=xelatex \
  --top-level-division=chapter \
  --syntax-highlighting=idiomatic
```
