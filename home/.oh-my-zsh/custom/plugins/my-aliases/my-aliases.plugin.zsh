alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias z='zed .'


function ytid() {
  echo "$1" | sed -E 's|.*/||'
}

function yt {
    local id
    id=$(ytid "$1")
    yt-dlp -f b --simulate --exec video:'/Applications/VLC.app/Contents/MacOS/VLC --meta-title=%(title)#q %(url)#q' https://www.youtube.com/watch\?v\=$id
}


function qrcode() {
    qrencode -s 6 -l H -o "$1.png" "$1"
}

alias brew.up='brew update && brew upgrade && brew cleanup --prune=all && brew doctor'

alias xcode.normal='sudo xcode-select -s /Applications/Xcode.app/Contents/Developer/'
alias xcode.beta='sudo xcode-select -s /Applications/Xcode-beta.app/Contents/Developer/'

alias symbolicate="DEVELOPER_DIR=$(xcode-select -p) /Applications/Xcode.app/Contents/SharedFrameworks/DTDeviceKitBase.framework/Versions/A/Resources/symbolicatecrash"

alias ederived='rm -rf ~/Library/Developer/Xcode/DerivedData/*'

alias x='ls|grep "Package.swift\|xcworkspace\|xcodeproj\|playground"|sort -r|head -n 1| xargs open -a Xcode'

alias codesigndoc='bash -l -c "$(curl -sfL https://raw.githubusercontent.com/bitrise-tools/codesigndoc/master/_scripts/install_wrap-xcode.sh)"'

alias oprov='cd ~/Library/MobileDevice/Provisioning\ Profiles && open .'

alias spm.init.executable='swift package init --type=executable'
alias spm.init.library='swift package init --type=library'
alias spm.fuck.it='rm -rf .build/ && rm -rf Package.resolved && rm -rf *.xcodeproj'

function swift.lines {
    find . -type f -name "*.swift" -exec grep -H -c '[^[:space:]]' {} \; | \sort -nr -t":" -k2 | awk -F: '{printf("Your largest file %s contains: %s lines \n", $1, $2); exit;}'
}

alias ip="ipconfig getifaddr en0"
alias netlisteners='lsof -i -P | grep LISTEN'
#alias json='python -m json.tool'
#  brew install pygments
alias json='json_pp|pygmentize -l json'

alias killds='find . -name *.DS_Store -type f -delete'


function ffdl() {
    ffmpeg -protocol_whitelist file,http,https,tcp,tls -i "$1" -c copy "/Users/tib/movie-$(date +%d.%m.%y-%H:%M:%S).ts"
}

alias meet="open -a Dia http://meet.google.com/new"

alias png="ping 8.8.8.8"
