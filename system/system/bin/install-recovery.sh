#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:599d53c58b9dcc11c057aeabb323bafa396799c5; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:763ca245772a86372b4afaa1ca33768ffbdb0a39 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:599d53c58b9dcc11c057aeabb323bafa396799c5 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
