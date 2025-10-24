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
