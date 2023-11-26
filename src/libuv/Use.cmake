
function(UseLibuv targetName version)

    CpmAddPackage(
            NAME uv
            GITHUB_REPOSITORY "libuv/libuv"
            GIT_TAG ${version}
    )

endfunction()