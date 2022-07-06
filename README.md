# windows-debug
krew plugin for launching a Windows host process pod that will give you access to the specified Windows node.

## Usage

```bash
krew install windows-debug
kubectl windows debug <node-name>
```

## Images with debug tools in them

The command uses an image with some basic debugging tools, like vim.  

It is also built using the host process scratch image which contains nothing but the tools required.  This minimizes download times since you don't need to download nanoserver or windows server core images which are large and the binaries are not used in host process pods.

The scratch image has a limitation that it can only be built with buildx.  Buildx cannot be used to install the tools since it doesn't support `RUN` commands for Windows.  To work around this, the installer image is built on windows and used a cache.  The final image copies the files from the cache to the scratch image.

## Using a custom image
If you don't want the extra tools or you have custom tools you want installed you can specify a custom image:

```bash
kubectl windows debug <node-name> --image <image-name>
```

## Releasing
Released with [krew release bot](https://github.com/rajatjindal/krew-release-bot).
