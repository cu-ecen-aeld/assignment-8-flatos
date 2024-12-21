
##############################################################
#
# LDD
#
##############################################################

# LDD_VERSION = e50021f		#'#COMMIT VERSION NUMBER'
LDD_VERSION = 4324f1c		#'#COMMIT VERSION NUMBER'




# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com

#'#GITHUB REPOSITORY LINK'
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-flatos.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
#LDD_MODULE_SUBDIRS = scull misc-modules		#
LDD_MODULE_SUBDIRS += misc-modules
LDD_MODULE_SUBDIRS += scull
# see https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

# define LDD_BUILD_CMDS
# 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules all
# endef

# Doesn't work
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/

endef

$(eval $(kernel-module))
$(eval $(generic-package))
