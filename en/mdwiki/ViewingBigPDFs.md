# ViewingBigPDFs
The 'evince' PDF viewer in Debian and Ubuntu can't deal well with large files.
One can fix this with the workaround below.

I've had good luck with setting the cache to 256

See https://bugs.launchpad.net/ubuntu/+source/evince/+bug/721217


```
Workaround:

Test your settings in Evince:

$ gsettings get org.gnome.Evince page-cache-size

Set a new (bigger) value instead:

$ gsettings set org.gnome.Evince page-cache-size 100

I tried it with 256 as value and can zoom my documents till 200%.
```
