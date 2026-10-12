# What is utanmatsu?
An attempt at making a user-friendly CLI frontend for UTAU resamplers and wavtools. Basically like every other UTAU frontend but 100% controlled from the terminal.

# Cloning
You can view and clone this project either from GitHub or Radicle.

## GitHub remote

_([Link](https://github.com/Cheese-Slice-1/utanmatsu))_

Using Git, `cd` to where you want the repo to be, and run:
```
$ git clone https://github.com/Cheese-Slice-1/utanmatsu.git
```

\
If you're using GitHub Desktop, go to File -> Clone repository, enter the "URL" tab, then paste the full URL (or put "Cheese-Slice-1/utanmatsu"). From there, choose where to clone utanmatsu to.

## Radicle remote

_([Link](https://app.radicle.xyz/nodes/iris.radicle.xyz/rad:z23WScz6Hbq2A5uCKsNkomk59XfAV))_

Simply [install radicle](https://radicle.dev/download), `cd` to where you want the repo to be, and run:

```
$ rad clone rad:z23WScz6Hbq2A5uCKsNkomk59XfAV
```

# Building

## Necessary packages

To build utanmatsu you theoretically only need [Odin](https://odin-lang.org/docs/install/). However, to do use the justfile's building recipes, you need [just](https://just.systems/man/en/installation.html). Using the build recipes is recommended.

On NixOS and systems using the Nix package manager, you have to methods:
- Manually enter a shell with both Odin and just (non-reproducible)
- Use one of the shells provided here (reproducible)

To use the shells in this repo, go to the project root and run either:
```
$ nix-shell # without flakes
```
or:
```
$ nix develop # with flakes
```

\
On systems NOT using Nix, you need to install the two packages manually: [Odin](https://odin-lang.org/docs/install/), [just](https://just.systems/man/en/installation.html)

After you get your hands on the packages needed, run `just build`, and voilà, an executable will appear under `bin`. Available recipes aside from `build` (like `clean` and `check`) can be viewed by running `just -l`.

