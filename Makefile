VARIANTS = quilt fabric
BUILD_DIR = ./build

all: $(VARIANTS)

$(VARIANTS): %: %-mrpack %-zip
	mv *.zip *.mrpack $(BUILD_DIR)/

%-mrpack:
	packwiz modrinth export --meta-folder-base ./$*/ --pack-file ./$*/pack.toml

%-zip:
	packwiz curseforge export --meta-folder-base ./$*/ --pack-file ./$*/pack.toml

qp%:
	packwiz$* --meta-folder-base ./quilt/ --pack-file ./quilt/pack.toml

fp%:
	packwiz$* --meta-folder-base ./fabric/ --pack-file ./fabric/pack.toml


.PHONY = clean
clean:
	rm -rf $(BUILD_DIR)/*