for d in *_4000au{,_ratio}/; do
    o="out/${d/_4000au/}"
    outdir="${o%/}_combined"
    mkdir -p $outdir
    for frame in ${d}*.png; do
        b=$(basename $frame)
        b="${b#*/}"
        b="${b%.png}"
        b="${b/_4000AU/}"

        oframe="${frame//_4000/_25000}"
        if [ -f $frame ] && [ -f $oframe ]; then
            # echo Pair $frame $oframe found
            magick convert $oframe $frame +append -background white -alpha remove -alpha off $outdir/$b.png
        else
            echo Unable to find $frame $oframe
        fi
    done
done
