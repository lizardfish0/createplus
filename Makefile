VARIANTS = quilt fabric
BUILD_DIR = ./build

all: $(VARIANTS)

$(VARIANTS): %: %-mrpack %-zip
	mv *.zip ./build/
	mv *.mrpack ./build/

%-mrpack:
	packwiz modrinth export --meta-folder-base ./$*/ --pack-file ./$*/pack.toml

%-zip:
	packwiz curseforge export --meta-folder-base ./$*/ --pack-file ./$*/pack.toml

.PHONY = clean
clean:
	rm $(BUILD_DIR)/*