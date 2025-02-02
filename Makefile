.PHONY: dependencies
dependencies:
	flutter pub get

.PHONY: analyze
analyze:
	flutter analyze

.PHONY: format 
format:
	flutter format lib/

.PHONY: format-analyze
format-analyze:
	flutter format --dry-run lib/
	flutter analyze

.PHONY: build-runner
build-runner:
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: build-watch
build-watch:
	flutter pub run build_runner watch --delete-conflicting-outputs

.PHONY: run-dev
run-dev:
	flutter run --flavor dev --dart-define=FLAVOR=dev --target lib/main.dart

.PHONY: run-qa
run-qa:
	flutter run --flavor qa --dart-define=FLAVOR=qa --target lib/main.dart

.PHONY: run-stg
run-stg:
	flutter run --flavor staging --dart-define=FLAVOR=staging --target lib/main.dart

.PHONY: run-prd
run-prd:
	flutter run --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-android-dev
build-android-dev:
	flutter build apk --flavor dev --dart-define=FLAVOR=dev --target lib/main.dart

.PHONY: build-android-qa
build-android-qa:
	flutter build apk --flavor qa --dart-define=FLAVOR=qa --target lib/main.dart

.PHONY: build-android-stg
build-android-stg:
	flutter build apk --flavor staging --dart-define=FLAVOR=staging --target lib/main.dart

.PHONY: build-android-prd
build-android-prd:
	flutter build apk --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-ios-dev
build-ios-dev:
	flutter build ios --no-codesign --flavor dev --dart-define=FLAVOR=dev --target lib/main.dart

.PHONY: build-ios-prd
build-ios-prd:
	flutter build ios --release --no-codesign --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: unit-test
unit-test:
	flutter test --coverage --coverage-path=./coverage/lcov.info

.PHONY: codecov
codecov:
	./scripts/codecov.sh ${CODECOV_TOKEN}

