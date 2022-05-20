function llvm -d "set the llvm path&variables"
    switch (uname)
    case Darwin
        echo MAC
    case Linux
        set -gx LDFLAGS -L/usr/lib/llvm/lib
        set -gx CPPFLAGS -I/usr/lib/llvm/include
    end
end
