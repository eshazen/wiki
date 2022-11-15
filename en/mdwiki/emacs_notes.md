# emacs_notes
### Emacs is Always Fun
[BR](BR.md)
edit files through ssh
```
emacs /ssh:username@destination:/path_to_file -nw
```
run a terminal in emacs, this even works through ssh as described above if you want to get real crazy
```
alt-x shell
```
It's hard to keep track of syntax for commenting code across multiple langues, be cool and use these functions on a given block of code.
```
alt-x comment-region
alt-x uncomment-region
```
