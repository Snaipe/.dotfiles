PATH="$(echo "$PATH" | /bin/awk -F: '
BEGIN {
    RS=":";
}{
    sub(sprintf("%c$",10),"");
    if (A[$0]) {
    } else {
        A[$0]=1;
        printf(((NR==1)?"":":")$0)
    }
}')"
