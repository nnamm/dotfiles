if test (uname) != Linux
    return
end

set -gx VCPKG_ROOT $HOME/vcpkg

if not contains $VCPKG_ROOT $PATH
    set -gx PATH $VCPKG_ROOT $PATH
end
