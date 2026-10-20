switch (uname)
    case Linux
        set -gx VULKAN_SDK $HOME/vulkan/default/x86_64
        set -gx LD_LIBRARY_PATH $VULKAN_SDK/lib $LD_LIBRARY_PATH
        set -gx VK_ADD_LAYER_PATH $VULKAN_SDK/share/vulkan/explicit_layer.d
        set -gx PKG_CONFIG_PATH $VULKAN_SDK/share/pkgconfig $VULKAN_SDK/lib/pkgconfig $PKG_CONFIG_PATH
        set -gx CMAKE_PREFIX_PATH $VULKAN_SDK $VULKAN_SDK/lib/VulkanLoader

    case Darwin
        # The global install in /usr/local covers the loader, ICDs and layers at runtime.
        # Here we only point the build tools at the SDK.
        if not test -d $HOME/VulkanSDK/default/macOS
            return
        end

        set -gx VULKAN_SDK $HOME/VulkanSDK/default/macOS
        set -gx VK_DRIVER_FILES $VULKAN_SDK/share/vulkan/icd.d/libkosmickrisp_icd.json
        set -gx PKG_CONFIG_PATH $VULKAN_SDK/lib/pkgconfig $PKG_CONFIG_PATH
        set -gx CMAKE_PREFIX_PATH $VULKAN_SDK

    case '*'
        return
end

if not contains $VULKAN_SDK/bin $PATH
    set -gx PATH $VULKAN_SDK/bin $PATH
end
