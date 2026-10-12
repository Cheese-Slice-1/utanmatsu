set unstable

help:
    @echo List recipes and their short descriptions with \"just -l\"
    @echo
    @echo On running/building this project:
    @echo '*' To run this project, run \"just run\" and pass \(or not\) parameters
    @echo '*' To, instead, build this project, run \"just build\", or \"just build-for \[target]\" \(replace \"\[target]\"\)
    @echo
    @echo You can check all available targets with \"odin build -target:?\"
    @echo If you want to build the project manually and see all available Odin commands and options, run \"odin help\"

run args="":
    odin run src -- {{args}}

check:
    odin check src -vet-unused

# ----- UNIX-like-specific recipes -----

[unix]
build:
    mkdir -p bin
    odin build src -out:bin/utanmatsu

# build for a specific target and microarchitecture
[unix]
build-for target microarch="":
    @echo ~ building for {{target}}{{microarch && " with microarch " + microarch}} ~
    
    mkdir -p bin/{{target}}
    odin build src \
        -target:{{target}} \
        {{microarch && "-microarch:" + microarch}} \
        -out:bin/{{target}}/utanmatsu-{{target}}{{microarch && "-"+microarch}}

[unix]
clean:
    rm -r bin/*


# ----- Windows-specific recipes -----

[windows]
build:
    odin build src -out:bin\utanmatsu.exe

