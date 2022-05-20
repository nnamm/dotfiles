function llvm -d "set the llvm path&variables"
    switch (uname)
    case Darwin
        echo MAC
    case Linux
        set -x LDFLAGS -L/usr/lib/llvm/lib
        set -x CPPFLAGS -I/usr/lib/llvm/include
    end
end
