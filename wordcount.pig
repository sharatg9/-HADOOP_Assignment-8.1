inp = load '/project/pig/demo.txt/' as (line);
words = foreach inp generate flatten(TOKENIZE(line)) as word;
grpd = group words by word;
cntd = foreach grpd generate group, COUNT(words);
dump cntd;