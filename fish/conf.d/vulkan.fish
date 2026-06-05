if test (uname) != Linux
    return
end

set -gx VULKAN_SDK $HOME/vulkan/default/x86_64

if not contains $VULKAN_SDK/bin $PATH
    set -gx PATH $VULKAN_SDK/bin $PATH
end

set -gx LD_LIBRARY_PATH $VULKAN_SDK/lib $LD_LIBRARY_PATH
set -gx VK_ADD_LAYER_PATH $VULKAN_SDK/share/vulkan/explicit_layer.d
set -gx PKG_CONFIG_PATH $VULKAN_SDK/share/pkgconfig $VULKAN_SDK/lib/pkgconfig $PKG_CONFIG_PATH
set -gx CMAKE_PREFIX_PATH $VULKAN_SDK $VULKAN_SDK/lib/VulkanLoader
