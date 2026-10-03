function .. {
  cd ..
}

function ... {
  cd ../..
}

function .... {
  cd ../../..
}

function ac {
  a cuke
}

function act {
  a cukethis
}

function af {
  a fix
}

function al {
  a lint
}

function ap {
  a ps
}

function apsa {
  a psa
}

function au {
  a unit
}

function l {
  ls -1
}

function la {
  ls -la
}


function br {
  git town branch "$@"
}

function co {
  git checkout "$@"
}

function ga {
  git add .
}

function gac {
  git add -A
  git commit -m "${*:-progress}"
}

function gacs {
  git add -A
  git commit -m "${*:-progress} [skip ci]"
}

function gacp {
  git add -A
  git commit -m "${*:-progress}"
  git push
}

function gacsp {
  git add -A
  git commit -m "${*:-progress} [skip ci]"
  git push
}

function gd {
  git diff "$@"
}

function gdm {
  git diff main
}

function gdp {
  git diff-parent
}

function gdpw {
  git diff-parent -w
}

function gdw {
  git diff HEAD --color-words
}

function gp {
  git push "$@"
}

function gpf {
  git push --force
}

function gpr {
  git propose
}

function gs {
  git sync "$@"
}

function gsa {
  git sync --all
}

function gss {
  git sync --stack
}

function gt {
  git town "$@"
}

function gtc {
  git town continue
}

function gts {
  git town switch
}

function mc {
  make cuke
}

function mct {
  make cukethis
}

function st {
  git status "$@"
}
