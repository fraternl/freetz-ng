$(call PKG_INIT_BIN, 1.19.4)
$(PKG)_SOURCE:=$(pkg)-$($(PKG)_VERSION).tar.bz2
$(PKG)_SOURCE_MD5:=9c0cae5a0379228e7b55e5b29528df8e
$(PKG)_SITE:=http://www.busybox.net/downloads

$(PKG)_SOURCE_DIR:=$($(PKG)_SOURCE_DIR)/ref-$($(PKG)_REF)
$(PKG)_DIR:=$($(PKG)_SOURCE_DIR)/$(pkg)-$($(PKG)_VERSION)
$(PKG)_BINARY:=$($(PKG)_DIR)/$(pkg)

$(PKG)_TARGET_DIR:=$(subst -$($(PKG)_VERSION),,$($(PKG)_TARGET_DIR))
$(PKG)_TARGET_BINARY:=$($(PKG)_TARGET_DIR)/$(pkg)-$($(PKG)_REF)

$(PKG)_CONFIG_FILE:=$($(PKG)_MAKE_DIR)/Config.$($(PKG)_REF)
$(PKG)_CUSTOM_CONFIG_FILE:=$($(PKG)_SOURCE_DIR)/$(pkg)-$($(PKG)_VERSION)-Config.custom
$(PKG)_CUSTOM_CONFIG_TEMP:=$($(PKG)_SOURCE_DIR)/$(pkg)-$($(PKG)_VERSION)-Config.temp

ifneq ($(strip $(DL_DIR)/$(BUSYBOX_SOURCE)), $(strip $(DL_DIR)/$(BUSYBOX_TOOLS_SOURCE)))
$(PKG_SOURCE_DOWNLOAD)
endif
$(PKG_UNPACKED)

$($(PKG)_CUSTOM_CONFIG_FILE): $(TOPDIR)/.config $($(PKG)_CONFIG_FILE)
	@cp -p $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_CUSTOM_CONFIG_TEMP)
	@$(call PKG_EDIT_CONFIG, \
		CONFIG_LONG_OPTS=$(FREETZ_BUSYBOX_LONG_OPTS) \
		\
		CONFIG_AR=$(FREETZ_BUSYBOX_AR) \
		CONFIG_FEATURE_AR_LONG_FILENAMES=$(FREETZ_BUSYBOX_AR) \
		\
		CONFIG_BLKID=$(FREETZ_BUSYBOX_BLKID) \
		CONFIG_FEATURE_BLKID_TYPE=$(FREETZ_BUSYBOX_BLKID_TYPE) \
		\
		CONFIG_BRCTL=$(FREETZ_BUSYBOX_BRCTL) \
		CONFIG_FEATURE_BRCTL_FANCY=$(FREETZ_BUSYBOX_BRCTL_FANCY) \
		CONFIG_FEATURE_BRCTL_SHOW=$(FREETZ_BUSYBOX_BRCTL_SHOW) \
		\
		CONFIG_BZIP2=$(FREETZ_BUSYBOX_BZIP2) \
		\
		CONFIG_CHGRP=$(FREETZ_BUSYBOX_CHGRP) \
		\
		CONFIG_FEATURE_DD_IBS_OBS=$(FREETZ_BUSYBOX_FEATURE_DD_IBS_OBS) \
		\
		CONFIG_DIFF=$(FREETZ_BUSYBOX_DIFF) \
		CONFIG_FEATURE_DIFF_BINARY=$(FREETZ_BUSYBOX_DIFF) \
		CONFIG_FEATURE_DIFF_DIR=$(FREETZ_BUSYBOX_DIFF) \
		CONFIG_FEATURE_DIFF_MINIMAL=$(FREETZ_BUSYBOX_DIFF) \
		\
		CONFIG_DNSD=$(FREETZ_BUSYBOX_DNSD) \
		\
		CONFIG_DOS2UNIX=$(FREETZ_BUSYBOX_DOS2UNIX) \
		\
		CONFIG_ETHER_WAKE=$(FREETZ_BUSYBOX_ETHER_WAKE) \
		\
		CONFIG_FEATURE_EDITING_FANCY_KEYS=$(FREETZ_BUSYBOX_FANCY_KEYS) \
		\
		CONFIG_FAKEIDENTD=$(FREETZ_BUSYBOX_FAKEIDENTD) \
		\
		CONFIG_FINDFS=$(FREETZ_BUSYBOX_FINDFS) \
		\
		CONFIG_FUSER=$(FREETZ_BUSYBOX_FUSER) \
		\
		CONFIG_INETD=$(FREETZ_BUSYBOX_INETD) \
		CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=$(FREETZ_BUSYBOX_INETD) \
		CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=$(FREETZ_BUSYBOX_INETD) \
		\
		CONFIG_IP=$(FREETZ_BUSYBOX_IP) \
		CONFIG_FEATURE_IP_ADDRESS=$(FREETZ_BUSYBOX_FEATURE_IP_ADDRESS) \
		CONFIG_FEATURE_IP_LINK=$(FREETZ_BUSYBOX_FEATURE_IP_LINK) \
		CONFIG_FEATURE_IP_ROUTE=$(FREETZ_BUSYBOX_FEATURE_IP_ROUTE) \
		CONFIG_FEATURE_IP_TUNNEL=$(FREETZ_BUSYBOX_FEATURE_IP_TUNNEL) \
		CONFIG_FEATURE_IP_RULE=$(FREETZ_BUSYBOX_FEATURE_IP_RULE) \
		\
		CONFIG_LAST=$(FREETZ_BUSYBOX_LAST) \
		CONFIG_FEATURE_LAST_FANCY=$(FREETZ_BUSYBOX_LAST) \
		CONFIG_FEATURE_WTMP=$(FREETZ_BUSYBOX_LAST) \
		CONFIG_LESS=$(FREETZ_BUSYBOX_LESS) \
		CONFIG_FEATURE_LESS_BRACKETS=$(FREETZ_BUSYBOX_LESS) \
		CONFIG_FEATURE_LESS_REGEXP=$(FREETZ_BUSYBOX_LESS) \
		CONFIG_FEATURE_LESS_FLAGS=$(FREETZ_BUSYBOX_LESS) \
		CONFIG_FEATURE_LESS_MAXLINES=9999999 \
		\
		CONFIG_FEATURE_LS_COLOR=$(FREETZ_BUSYBOX_LS_COLOR) \
		CONFIG_FEATURE_LS_COLOR_IS_DEFAULT=$(FREETZ_BUSYBOX_LS_COLOR) \
		\
		CONFIG_MD5SUM=$(FREETZ_BUSYBOX_MD5SUM) \
		CONFIG_SHA1SUM=$(FREETZ_BUSYBOX_SHA1SUM) \
		CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=$(if $(strip $(FREETZ_BUSYBOX_MD5SUM))$(strip $(FREETZ_BUSYBOX_SHA1SUM)),y) \
		\
		CONFIG_MDEV=$(FREETZ_BUSYBOX_MDEV) \
		CONFIG_FEATURE_MDEV_CONF=$(FREETZ_BUSYBOX_MDEV_CONF) \
		CONFIG_FEATURE_MDEV_RENAME=$(FREETZ_BUSYBOX_MDEV_RENAME) \
		CONFIG_FEATURE_MDEV_RENAME_REGEXP=$(FREETZ_BUSYBOX_MDEV_RENAME_REGEXP) \
		CONFIG_FEATURE_MDEV_EXEC=$(FREETZ_BUSYBOX_MDEV_EXEC) \
		\
		CONFIG_MODINFO=$(FREETZ_BUSYBOX_MODINFO) \
		\
		CONFIG_FEATURE_MOUNT_LABEL=$(FREETZ_BUSYBOX_MOUNT_LABEL) \
		CONFIG_FEATURE_MOUNT_HELPERS=$(FREETZ_BUSYBOX_MOUNT_HELPERS) \
		\
		CONFIG_NICE=$(FREETZ_BUSYBOX_NICE) \
		\
		CONFIG_PATCH=$(FREETZ_BUSYBOX_PATCH) \
		\
		CONFIG_PSCAN=$(FREETZ_BUSYBOX_PSCAN) \
		\
		CONFIG_REALPATH=$(FREETZ_BUSYBOX_REALPATH) \
		\
		CONFIG_RENICE=$(FREETZ_BUSYBOX_RENICE) \
		\
		CONFIG_SEQ=$(FREETZ_BUSYBOX_SEQ) \
		\
		CONFIG_SPLIT=$(FREETZ_BUSYBOX_SPLIT) \
		CONFIG_FEATURE_SPLIT_FANCY=$(FREETZ_BUSYBOX_SPLIT) \
		\
		CONFIG_START_STOP_DAEMON=$(FREETZ_BUSYBOX_START_STOP_DAEMON) \
		CONFIG_FEATURE_START_STOP_DAEMON_FANCY=$(FREETZ_BUSYBOX_START_STOP_DAEMON) \
		\
		CONFIG_STUN_IP=$(FREETZ_BUSYBOX_STUN_IP) \
		\
		CONFIG_TAC=$(FREETZ_BUSYBOX_TAC) \
		\
		CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=$(FREETZ_BUSYBOX_TAR_OLDGNU_COMPATIBILITY) \
		\
		CONFIG_UDHCPC=$(FREETZ_BUSYBOX_UDHCPC) \
		CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=$(FREETZ_BUSYBOX_SLACK_FOR_BUGGY_SERVERS) \
		\
		CONFIG_UDHCPD=$(FREETZ_BUSYBOX_UDHCPD) \
		CONFIG_DHCPD_LEASES_FILE=$(FREETZ_BUSYBOX_UDHCPD_LEASES_FILE) \
		\
		CONFIG_UNIX2DOS=$(FREETZ_BUSYBOX_UNIX2DOS) \
		\
		CONFIG_UNZIP=$(FREETZ_BUSYBOX_UNZIP) \
		\
		CONFIG_FEATURE_USERNAME_COMPLETION=$(FREETZ_BUSYBOX_FEATURE_USERNAME_COMPLETION) \
		\
		CONFIG_USLEEP=$(FREETZ_BUSYBOX_USLEEP) \
		\
		CONFIG_VOLUMEID=$(FREETZ_BUSYBOX_VOLUMEID) \
		CONFIG_FEATURE_VOLUMEID_EXT=$(FREETZ_BUSYBOX_VOLUMEID_EXT) \
		CONFIG_FEATURE_VOLUMEID_FAT=$(FREETZ_BUSYBOX_VOLUMEID_FAT) \
		CONFIG_FEATURE_VOLUMEID_HFS=$(FREETZ_BUSYBOX_VOLUMEID_HFS) \
		CONFIG_FEATURE_VOLUMEID_LINUXRAID=$(FREETZ_BUSYBOX_VOLUMEID_LINUXRAID) \
		CONFIG_FEATURE_VOLUMEID_LINUXSWAP=$(FREETZ_BUSYBOX_VOLUMEID_LINUXSWAP) \
		CONFIG_FEATURE_VOLUMEID_LUKS=$(FREETZ_BUSYBOX_VOLUMEID_LUKS) \
		CONFIG_FEATURE_VOLUMEID_NTFS=$(FREETZ_BUSYBOX_VOLUMEID_NTFS) \
		CONFIG_FEATURE_VOLUMEID_REISERFS=$(FREETZ_BUSYBOX_VOLUMEID_REISERFS) \
		\
		CONFIG_WGET=$(FREETZ_BUSYBOX_WGET) \
		\
		CONFIG_WHO=$(FREETZ_BUSYBOX_WHO) \
		CONFIG_FEATURE_UTMP=$(FREETZ_BUSYBOX_WHO) \
		\
		CONFIG_WHOAMI=$(FREETZ_BUSYBOX_WHOAMI) \
		\
		CONFIG_FEATURE_IPV6=$(FREETZ_TARGET_IPV6_SUPPORT) \
		CONFIG_FEATURE_PREFER_IPV4_ADDRESS=$(FREETZ_BUSYBOX_FEATURE_PREFER_IPV4_ADDRESS) \
		CONFIG_PING6=$(FREETZ_BUSYBOX_PING6) \
		CONFIG_TRACEROUTE6=$(FREETZ_BUSYBOX_TRACEROUTE6) \
	) $(BUSYBOX_CUSTOM_CONFIG_TEMP)
	@diff -q $(BUSYBOX_CUSTOM_CONFIG_TEMP) $(BUSYBOX_CUSTOM_CONFIG_FILE) >/dev/null 2>&1 || \
		cp $(BUSYBOX_CUSTOM_CONFIG_TEMP) $(BUSYBOX_CUSTOM_CONFIG_FILE)
	@rm -f $(BUSYBOX_CUSTOM_CONFIG_TEMP)

$($(PKG)_DIR)/.configured: $($(PKG)_DIR)/.unpacked $($(PKG)_CUSTOM_CONFIG_FILE)
	cp $(BUSYBOX_CUSTOM_CONFIG_FILE) $(BUSYBOX_DIR)/.config
	$(call PKG_EDIT_CONFIG, CONFIG_LFS=$(FREETZ_TARGET_LFS)) $(BUSYBOX_DIR)/.config
	$(SUBMAKE) CC="$(TARGET_CC)" \
		CROSS_COMPILE="$(TARGET_MAKE_PATH)/$(TARGET_CROSS)" \
		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		-C $(BUSYBOX_DIR) oldconfig
	touch $@

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured
	$(SUBMAKE) CC="$(TARGET_CC)" \
		CROSS_COMPILE="$(TARGET_MAKE_PATH)/$(TARGET_CROSS)" \
		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		ARCH="mips" \
		-C $(BUSYBOX_DIR)

$($(PKG)_BINARY).links: $($(PKG)_BINARY)
	$(SUBMAKE) CC="$(TARGET_CC)" \
		CROSS_COMPILE="$(TARGET_MAKE_PATH)/$(TARGET_CROSS)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		-C $(BUSYBOX_DIR) busybox.links
	touch $@

$($(PKG)_TARGET_BINARY): $($(PKG)_BINARY)
	$(INSTALL_BINARY_STRIP)

$($(PKG)_TARGET_BINARY).links: $($(PKG)_BINARY).links
	cp $(BUSYBOX_BINARY).links $(BUSYBOX_TARGET_BINARY).links

$(pkg)-source: $($(PKG)_DIR)/.unpacked

$(pkg)-menuconfig: $($(PKG)_DIR)/.unpacked $($(PKG)_CONFIG_FILE)
	cp $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config
	$(SUBMAKE) CC="$(TARGET_CC)" \
		CROSS_COMPILE="$(TARGET_MAKE_PATH)/$(TARGET_CROSS)" \
		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		-C $(BUSYBOX_DIR) menuconfig
	cp $(BUSYBOX_DIR)/.config $(BUSYBOX_CONFIG_FILE)

$(pkg)-oldconfig: $($(PKG)_DIR)/.configured

$(pkg)-precompiled: uclibc $($(PKG)_TARGET_BINARY) $($(PKG)_TARGET_BINARY).links

$(pkg)-clean: busybox-uninstall
	-$(SUBMAKE) -C $(BUSYBOX_DIR) clean

$(pkg)-uninstall:
	$(RM) $(BUSYBOX_TARGET_BINARY) $(BUSYBOX_TARGET_BINARY).links

$(pkg)-dirclean:
	$(RM) -r $(BUSYBOX_DIR)
	$(RM) $(BUSYBOX_CUSTOM_CONFIG_FILE)
	$(RM) $(BUSYBOX_TARGET_DIR)/busybox-*

$(pkg)-distclean: busybox-dirclean

.PHONY: busybox-menuconfig busybox-oldconfig

$(PKG_FINISH)
