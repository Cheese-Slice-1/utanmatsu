set unstable

suffix := if os() == "windows" { ".exe" } else { "" }
arch := `uname -m`

help:
    @echo to list available recipes run `just -l`
    @echo your os: {{os()}}
    @echo your architecture: {{arch}}
    -odin build src -target:?
    -odin build src -microarch:?

run:
    odin run src

build:
    odin build src -out:bin/utanmatsu

build-for TARGET MICROARCH="":
    @echo building for {{TARGET}}{{MICROARCH && " with microarch " + MICROARCH}}
    odin build src -target:{{TARGET}} {{MICROARCH && "-microarch:" + MICROARCH}} -out:bin/{{TARGET}}/utanmatsu-{{TARGET}}{{MICROARCH && ('-' + MICROARCH)}}{{suffix}}

