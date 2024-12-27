

##############################################################
#
# LDD
#
##############################################################

# AESDCHAR_VERSION = c10b5b4		#'#COMMIT VERSION NUMBER'
# AESDCHAR_VERSION = 9999999		#'#COMMIT VERSION NUMBER'
AESDCHAR_VERSION = d4eece6		#'#COMMIT VERSION NUMBER'





# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com

#'#GITHUB REPOSITORY LINK'
AESDCHAR_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-flatos.git
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES
#LDD_MODULE_SUBDIRS = scull misc-modules		#

AESDCHAR_MODULE_SUBDIRS += aesd-char-driver
# AESDCHAR_MODULE_SUBDIRS = aesd-char-driver

# see https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules
AESDCHAR_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)


define AESDCHAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/

	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/S97aesdmodules $(TARGET_DIR)/etc/init.d/


endef

$(eval $(kernel-module))
$(eval $(generic-package))
