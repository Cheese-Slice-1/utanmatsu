set unstable

help:
    @echo to list available recipes run `just -l`
    @echo to see available targets, run \"odin build src -target:?\"
    @echo to see available microtargets, run \"odin build src -microarch:?\"

run ARGS="":
    odin run src -- {{ARGS}}

# ----- UNIX-like-specific recipes -----

# build directly for your system
[unix]
build:
    odin build src -out:bin/utanmatsu

# build for a specific target and microarchitecture
[unix]
build-for target microarch="":
    @echo ~ building for {{target}}{{microarch && " with microarch " + microarch}} ~
    
    -[ -d bin/{{target}} ] || mkdir bin/{{target}}
    odin build src \
        -target:{{target}} \
        {{microarch && "-microarch:" + microarch}} \
        -out:bin/{{target}}/utanmatsu-{{target}}{{microarch && "-"+microarch}}

# clean all executables
[unix]
clean:
    rm bin/*/*
    rm bin/utanmatsu


# ----- Windows-specific recipes -----

# build directly for your system
[windows]
build:
    odin build src -out:bin\utanmatsu.exe

