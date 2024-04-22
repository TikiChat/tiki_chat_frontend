xcode:
	@open ios/Runner.xcworkspace

clean_start:
	@echo "Execute flutter clean & flutter pub get"
	flutter clean
	flutter pub get
	@echo "Finish!!!!"

clean_cache_start:
	@echo "Execute flutter cache clean & flutter pub get"
	flutter pub cache clean
	flutter pub get
	@echo "Finish!!!!

build_runner:
	@echo "Execute build_runner"
	@flutter pub run build_runner build --delete-conflicting-outputs
	@echo "Finish!!!"