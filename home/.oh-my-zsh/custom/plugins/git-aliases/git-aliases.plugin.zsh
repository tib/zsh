alias git.key.rsa="ssh-keygen -t rsa -b 4096 -C"
alias git.key="ssh-keygen -t ed25519 -C"

alias git.init="git init"
alias git.init.bare="git init --bare"

alias git.config="git config"
alias git.config.list="git config --list"
alias git.config.edit="git config --edit"
alias git.config.set="git config"
alias git.config.unset="git config --unset"

alias git.config.global="git config --global"
alias git.config.global.list="git config --global --list"
alias git.config.global.edit="git config --global --edit"
alias git.config.global.set="git config --global"
alias git.config.global.unset="git config --global --unset"
alias git.config.remote="git config --global --add --bool push.autoSetupRemote true"

alias git.clone="git clone"

function git.clone.github { git.clone https://github.com/"$1".git; }

alias git.add="git add"
alias git.mv="git mv"

alias git.clean="git clean"
alias git.clean.all="git clean -d -x -f"

alias git.reset="git reset"
alias git.reset.hard="git reset --hard"

function git.reset.origin { git.reset.hard "$1"; git push origin HEAD --force; }

function git.fuck.it { git.clean.all; git.reset.hard; }

alias git.rm="git rm"
alias git.rm.all="git rm -rf ."

alias git.blame="git blame"
alias git.blame.lines="git blame -L"

alias git.bisect="git bisect"
alias git.grep="git grep"

alias git.log="git log"
alias git.log.list="git log --pretty=oneline"
alias git.log.last="git log -1"
alias git.log.last.id="git rev-parse HEAD"
alias git.log.search="git log --all --grep"
alias git.log.graph="git log --graph --oneline --decorate --all"
alias git.log.files="git diff-tree --no-commit-id --name-only -r"


alias git.show="git show"
alias git.status="git status"

alias git.stash="git stash"
alias git.stash.all="git stash list"
alias git.stash.apply="git stash apply"
alias git.stash.unapply="git stash show -p | git apply -R"

alias git.commit="git commit"
alias git.commit.all="git add -A && git commit -a -m"
alias git.commit.empty="git commit --allow-empty -m"
alias git.commit.count="git rev-list --count HEAD"
alias git.commit.count.all="git rev-list --all --count"

function git.commit.random { git.commit.all "`curl -s http://whatthecommit.com/index.txt`" --allow-empty; }

alias git.checkout="git checkout"
alias git.checkout.theirs="git checkout --theirs"
alias git.checkout.ours="git checkout --ours"
alias git.checkout.main="git checkout main"
alias git.checkout.dev="git checkout dev"
alias git.checkout.pr="git checkout pr"

function git.checkout.feature { git.checkout "feature/$1"; }

function git.checkout.origin { git.checkout -t origin/"$1"; git.reset; }

alias git.branch="git branch"
alias git.branch.all="git branch -a"
alias git.branch.create="git checkout -b"
alias git.branch.current="git rev-parse --abbrev-ref HEAD"
alias git.branch.rename="git branch -m"

alias git.branch.origins="git branch -vv"

alias git.branch.delete="git branch -D"
alias git.branch.delete.origin="git push origin --delete"
alias git.branch.delete.merged='git.prune && git.checkout.main && git branch --merged | grep -v "\*" | grep -v "main" | xargs -n 1 git branch -d'

function git.branch.set.origin { git branch "$1" --set-upstream-to origin/"$1"; }
function git.branch.publish { name="$(git.branch.current)"; git push --set-upstream origin "$name"; }

function git.branch.to { git.checkout "$1"; git.reset; }

function git.branch.create.orphan { git.checkout --orphan "$1"; git.rm.all; git.commit.empty "Initial commit"; }
function git.branch.create.origin { git.branch.create "$1"; git.branch.publish; }

alias git.diff="git diff"

alias git.merge="git merge"
alias git.merge.main="git merge main"
alias git.merge.dev="git merge dev"

function git.merge.feature { git.merge "feature/$1"; }

function git.merge.origin { git.merge origin/"$1"; }
function git.merge.upstream { git.merge upstream/"$1"; }

alias git.rebase="git rebase"

alias git.tag="git tag"
alias git.tag.publish="git push origin --tags"

function git.tag.release { git tag "v$1"; git.tag.publish; }

function git.tag.search { git tag -l "$1*"; }
function git.tag.create { git tag -a "$1" -m "$2"; }
function git.tag.recreate { git pull; git tag -d "$1"; git push origin :refs/tags/"$1"; git tag "$1"; git push origin "$1"; }
function git.tag.delete { git tag -d "$1"; }
function git.tag.list { git tag -l; }

alias git.push="git push"

function git.push.all { git.commit.all "$1"; git.push; }

alias git.remote="git remote"
alias git.remote.details="git remote -v"

function git.remote.fork.github { git remote add upstream https://github.com/"$1".git; }

alias git.origin.url="git config --get remote.origin.url"
alias git.origin.all="git ls-remote origin"
alias git.origin.head.remove="git remote set-head origin -d"

alias git.fetch="git fetch"
alias git.fetch.upstream="git fetch upstream"

alias git.pull="git pull"
alias git.prune="git fetch --prune origin"

function git.pull.request {
    #flow:
    #git merge origin/branch
    #git request-pull origin/branch origin my-branch
    #git request-pull branch origin my-branch

    if [ "$1" == "" ]; then
        echo "Please provide a branch name..."
        return
    fi

    current=$(git branch | sed -n '/\* /s///p')
    request="$(git request-pull $1 origin $current)"

    git checkout pr
    git clean -d -x -f
    git commit --allow-empty -m "$request"
    git push
    git checkout $current
    git clean -d -x -f
}

alias gl="git log -1"
alias gs="git.status"
alias gc="git.commit.all"
alias gp="git.push.all"
alias gm="git.checkout main && git pull && git.prune && git.cleanup.local"
alias ga="git.branch.all"
function gf { git.branch.create "feature/$1"; }
function gfx { git.branch.create "fix/$1"; }
alias p="gp"




