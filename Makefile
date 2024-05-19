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

##fastlane development 인증서 가져오기
get_fastlane_dev:
	@fastlane match development --readonly

##fastlane distribution 인증서 가져오기
get_fastlane_adhoc:
	@fastlane match adhoc --readonly

##fastlane appstore 인증서 가져오기
get_fastlane_app:
	@fastlane match appstore --readonly

##인증서 모두 삭제
del_cert:
	@fastlane match nuke development
	@fastlane match nuke distribution
	@fastlane match nuke appstore