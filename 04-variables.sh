#!/bin/bash
#DRY --> Don't repeat yourself
#Centralised place --> If you change at one place, it will update everywhere, reduced human errors & no accidental changes

PERSON1=$1
PERSON2=$2

echo "$PERSON1: Hi $PERSON2, How are you?"
echo "$PERSON2: Hello $PERSON1, I am fine, How you doing"
echo "$PERSON1: I am doing good $PERSON2, what's going on"
echo "$PERSON2: I started learning shell scripting $PERSON1"