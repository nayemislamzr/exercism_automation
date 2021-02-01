# Exercism automation

# Description :<br/>

## Usage :<br/>

+ Downloading **Exercism** easily & creating environment.
+ Downloading problems only by using name. (*no link needed also case insensitive*)
+ Managing <b>test file</b>,<b>submit files</b> easily using vim splitting window.
+ Submitting problem only by using one key press. <br/>

## Author :<br/>

+ **Name:** nayemislamzr<br/>

# Dependencies :<br/>

+ **VIM** ( VI Improved for easily managing files)
+ **Figlet** ( minor change in look )
+ **Snap** ( for installing exercism )
+ **FZF** ( fuzzy finder for searching problem )

# How to use : <br/>

1. clone the repo. 

```bash
git clone https://github.com/nayemislamzr/exercism_automation.git
```

2. Use Makefile for different purposes:

+ use `make all` for downloading all dependencies,downloading,managing & submitting problem .
+ use `make install` for installing all dependencies & exercism also . 
+ use `make submit` for problem downloading,problem managing , compiling & submiting .
+ use `make uninstall` for uninstalling Exercism only.
+ use `make clean` for uninstalling all dependencies that you have downloaded. ( suggested not to use ).

