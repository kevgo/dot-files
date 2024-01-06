function .. {
  cd ..
}

function ... {
  cd ../..
}

function .... {
  cd ../../..
}

function l {
  ls -1
}

function la {
  ls -la
}


function br {
  git branch "$@"
}

function co {
  git checkout "$@"
}

function ga {
  git add .
}

function gac {
  git add -A
  git commit -m "$*"
}

function gacp {
  git add -A
  git commit -m "$*"
  git push
}

function gd {
  git diff "$@"
}

function gdm {
  git diff main
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
