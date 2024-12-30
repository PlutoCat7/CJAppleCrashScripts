current_path=$(pwd)

export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"

swift convertFromJSON.swift -i est.ips -o est.crash

cp est.crash /Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/est.crash
cp -R est.dSYM /Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/est.dSYM

cd /Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/

./symbolicatecrash est.crash est.dSYM > out.crash

mv out.crash "$current_path/out.crash"


