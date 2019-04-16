# Statistics for the images running as root

The script here has list of the most commonly used apps in Micro services world. Using this list the script then finds out what is the corresponding official image of the application. Once that is available now you can inspect image to see if the user is still not defined which means it is root or is something non-root.

The list of apps in the script is not exhaustive but are the ones which I found people using the most. And hence the output is generated. There still is scope for making results generation to be automatic.

## Goal

The only goal of this exercise is to find out how many official images of most widely used applications still run as root inside them.

## Output

As per the current output the apps running as non-root are 12/68 and the rest 56 run apps as root inside them.
