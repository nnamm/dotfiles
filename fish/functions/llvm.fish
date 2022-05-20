function llvm -d "set the llvm path&variables"
    switch (uname)
    case Darwin
        set -g PATH "/usr/local/opt/llvm/bin" $PATH
        set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
        set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"
    case Linux
        set -gx LDFLAGS "-L/usr/lib/llvm/lib"
        set -gx CPPFLAGS "-I/usr/lib/llvm/include"
    end
end
