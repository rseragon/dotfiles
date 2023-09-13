for i in *.jpg; do
	convert "$i" -quality 10% "$i"
done
