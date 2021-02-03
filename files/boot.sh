echo 'Doing additional bootup things from `/boot.d/` ...'
bootpath='/boot.d/*.sh'
count=`ls -1 ${bootpath} 2>/dev/null | wc -l`
if [ $count != 0 ]; then
    chmod a+x ${bootpath}
    for f in ${bootpath}; do source $f; done
fi

echo "done with startup tasks"
