#!/bin/bash


PORT=9000
for i in $(cat nodos.txt)
do
echo $i
nc $i $PORT > $i.txt

done
