## Initial Project

- Add git ignore to the root directory
- Set Ruby Version:
  - ` $rbenv local 2.7.1`



## Adding Tools

- Add a dummy swift file (This file is need to add Xcodegen through SPM )

  - `$touch Tools/Dummy/Dummy.swift`

- Add Makefile

  - `$touch Tools/Makefile`

  ```makefile
  install: build move
  
  update:
  	swift package update
  	make install
  
  build:
  	swift build --disable-sandbox -c release
  
  move:
  	mkdir -p bin
  	cp -f .build/release/xcodegen bin/xcodegen
  	cp -fR .build/checkouts/XcodeGen/SettingPresets bin/SettingPresets
  
  xcodegen: # Add project yml file on each project directory
  	bin/xcodegen -s ../App/PresentationLayer/Project.yml 
  	bin/xcodegen -s ../App/DomainLayer/Project.yml 
  	bin/xcodegen -s ../App/DataLayer/Project.yml
  ```

- Add `Package.swift` to add `XcodeGen` through `SPM`

  - `$touch Tools/Package.swift`

    ```swift
    // swift-tools-version:5.3
    import PackageDescription
    
    let package = Package(
        name: "Tool",
        platforms: [.macOS(.v10_14)],
        dependencies: [
            .package(url: "https://github.com/yonaskolb/XcodeGen.git", .exact("2.25.0")),
        ],
        targets: [
            .target(
                name: "Dummy",
                dependencies: [
                    .product(name: "xcodegen", package: "XcodeGen"),
                ],
                path: ""
            ),
        ]
    )
    ```

  - Run XcodeGen

    -  `$make update` 

  ## Add Project Files

  - Add Workspace
  - Add a Xcode Project inside Workspace with it's units tests and ui tests
    - `File > New > Project > App`
  - Add Static Library/Framework as per your need and it's unit tests
    - `File > New > Project > Static Library/Framework`

## Adding Configuration

- Create `Configurations` Folder inside `/App` and add following files

  ```
  common.xcconfig
  
  PRODUCT_BUNDLE_IDENTIFIER_PRODUCT_NAME = My.$(TARGET_NAME)
  PRODUCT_BUNDLE_IDENTIFIER_Release = jp.co.binish.$(PRODUCT_BUNDLE_IDENTIFIER_PRODUCT_NAME)
  PRODUCT_BUNDLE_IDENTIFIER_Debug  = com.binish.$(PRODUCT_BUNDLE_IDENTIFIER_Release)
  PRODUCT_BUNDLE_IDENTIFIER = $(PRODUCT_BUNDLE_IDENTIFIER_$(CONFIGURATION))
  
  CURRENT_PROJECT_VERSION = 1.0
  
  CODE_SIGN_STYLE = Manual
  
  TARGETED_DEVICE_FAMILY = 1
  ```

  ```
  debug.xcconfig
  
  #include "common.xcconfig"
  
  ASSETCATALOG_COMPILER_APPICON_NAME = AppIconDebug
  
  #BACKEND_URL = https:/$()/www.staging.mytestapp.thoughtbot.com
  ```

  ```
  release.xcconfig
  
  #include "common.xcconfig"
  
  ASSETCATALOG_COMPILER_APPICON_NAME = AppIconRelease
  
  #BACKEND_URL = https:/$()/www.mytestapp.thoughtbot.com
  ```

  ## Add Project.yml

  - Add following yml files

  ```yaml
  # App/ProjectCommon.yml
  configs:
    Debug: debug
    Release: release
  
  configFiles:
    Debug: Configurations/debug.xcconfig
    Release: Configurations/release.xcconfig
  
  options:
    deploymentTarget:
      iOS: "13.0"
    groupSortPosition: top
    generateEmptyDirectories: true
  
  packages:
    RxSwift:
      url: https://github.com/ReactiveX/RxSwift.git
      from: 6.5.0
    RxCocoa:
      path: ""
  
  targetTemplates:
    WithUnitTest:
      scheme:
        testTargets:
          - name: ${target_name}Tests
            parallelizable: true
            randomExecutionOrder: true
        gatherCoverageData: true
    WithUITest:
      scheme:
        testTargets:
          - name: ${target_name}UITests
            parallelizable: true
            randomExecutionOrder: true
        gatherCoverageData: true
    WithUnitAndUITests:
      scheme:
        testTargets:
          - name: ${target_name}Tests
            parallelizable: true
            randomExecutionOrder: true
          - name: ${target_name}UITests
            parallelizable: true
            randomExecutionOrder: true
        gatherCoverageData: true
  
  ```

  ```yaml
  # App/DomainLayer/Project.yml
  name: DomainLayer
  
  include:
    - path: ../ProjectCommon.yml
  
  targets:
    DomainLayer:
      templates:
        - WithUnitTest
      platform: iOS
      type: library.static
      sources: DomainLayer
      dependencies:
        - package: RxSwift
        - package: RxCocoa
    DomainLayerTests:
      platform: iOS
      type: bundle.unit-test
      sources: DomainLayerTests
      dependencies:
        - target: DomainLayer
          embed: false
  ```

  ```yaml
  # App/DataLayer/Project.yml
  name: DataLayer
  
  include:
    - path: ../ProjectCommon.yml
  
  targets:
    DataLayer:
      templates:
        - WithUnitTest
      platform: iOS
      type: framework.static
      sources: DataLayer
      dependencies:
        - framework: libDomainLayer.a
          implicit: true
        - package: RxSwift
        - package: RxCocoa
    DataLayerTests:
      platform: iOS
      type: bundle.unit-test
      sources: DataLayerTests
      dependencies:
        - target: DataLayer
          embed: false
  ```

  ```yaml
  # App/PresentationLayer/Project.yml
  name: PresentationLayer
  
  include:
    - path: ../ProjectCommon.yml
  
  options:
    createIntermediateGroups: true
  
  targets:
    PresentationLayer:
      templates:
        - WithUnitAndUITests
      platform: iOS
      type: application
      sources: PresentationLayer
      dependencies:
        - framework: libDomainLayer.a
          implicit: true
        - framework: DataLayer.framework
          implicit: true
        - package: RxSwift
        - package: RxCocoa
    PresentationLayerTests:
      platform: iOS
      type: bundle.unit-test
      sources: PresentationLayerTests
      dependencies:
        - target: PresentationLayer
          embed: false
    PresentationLayerUITests:
      platform: iOS
      type: bundle.ui-testing
      sources: PresentationLayerUITests
      dependencies:
        - target: PresentationLayer
  ```

  ## Run XcodeGen Command

  - `$make xcodegen`

    

