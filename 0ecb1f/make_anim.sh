for d in out/*/; do
    if [ -n "$(ls -A $d)" ]; then
        magick convert -delay 40 -loop 0 ${d}/*.png ${d%/}.gif
    fi
done