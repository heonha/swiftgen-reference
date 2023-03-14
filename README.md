#  SwiftGen 빠르게 시작하는 방법. 

**이 프로젝트 내용으로 enum을 통한 구조화를 수행하여   
현지화 및 안전한 Assets 참조를 할 수 있습니다.**

<br>


### **준비**
***

**SwiftGen github (공식)**
- https://github.com/SwiftGen/SwiftGen

<br>

**🍺brew가 없는 경우 (Homebrew)**
- Homebrew Official: https://brew.sh/index_ko
- 빠른 설치 방법:   
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

<br>

> ⚠️참고사항   - swiftgen을 SPM, Cocoapods로 프로젝트 내에 설치하지 않고
> Homebrew로 설치하여 프로젝트에 초기화하여 사용합니다. (macOS용 패키지 관리자)

<br>

***

<br>

## SwiftGen 라이브러리 기초 샘플 프로젝트입니다.

<br>

1. 📦패키지 설치 (터미널)`brew install swiftgen`

<br>

2. 초기화 (프로젝트 최상위 디렉토리) `swiftgen config init`
    - 초기화가 완료되면 디렉토리에 swiftgen.yml파일이 생성됩니다.

<br>

3. Localizable.strings 파일 프로젝트에 추가 
   - `Localizable.strings` 생성
      - xcode에서 `cmd + N`
      - `strings` 형식 선택
      - `Localizable.strings` 생성
   - 현지화 할 내용 입력 
      - `"구문" = "현지화할 내용";` 입력 (ex:  `"title" = "home";`)
        - title이 enum으로 생성되고, home이 view에 표시될 내용.
         - `detail.navigationbar.title = "상세 뷰";` 이렇게도 가능합니다. (단계별로 enum 생성)

<br>

4. swiftgen.yml 구문 분석 
- 프로젝트 디렉토리에서 `swiftgen config lint`로 구문분석.

<br>

- -  -

**✅이상 없을 때 시 나타나는 메세지 (참고용)**
```
> Common parent directory used for all input paths:  <none>
> Common parent directory used for all output paths: <none>
> 1 entry for command strings:
 $ swiftgen strings --templateName structured-swift5 --param enumName=S --output swiftgen-samples/Strings+Generated.swift swiftgen-samples/Localizable.strings
> 1 entry for command xcassets:
 $ swiftgen xcassets --templateName swift5 --param enumName=I --output swiftgen-samples/XCAssets+Generated.swift swiftgen-samples/Assets.xcassets
 ```


**🚫Error 발생시 나타나는 메세지(참고용)**
```
Linting swiftgen.yml
Error: 49:6: error: parser: while parsing a block collection in line 48, column 6
did not find expected '-' indicator:
     params:
     ^
```

- - -

<br>

**5. 구문 생성 `swiftgen`**
  - swiftgen.yml의 config에 따라 Localizable.string, Assets.xcassets의 내용이 enum으로 구조화 됩니다.
  - Localizable.string 부분 `swiftgen.yml:18~25`
  - Assets.xcassets 부분 `swiftgen.yml:47~56`

<br>

6. 생성된 `*+Generated.swift` 파일을 xcode에 추가해주세요.
    - `swiftgen-samples/Strings+Generated.swift`
    - `swiftgen-samples/XCAssets+Generated.swift`

<br>

**7. `각 *+Generated.swift`에서 enum 생성 확인.**

   - 이제 title은 `S.title`를 참조하면 미리 정의한 `home`으로 나타납니다.
   - assets는 이 프로젝트에 heon이라는 이미지셋을 추가했다면 아래와 같이 사용할 수 있습니다.
      - `I.heon.image` 를 참조하면 UIImage를 return
      - `I.heon.name` assets에 추가한 name을 return
   - 이로서 assets에 더 안전하게 참조할 수 있습니다.

<br>

8. `swiftgen`으로 지속적으로 업데이트하기.
- 앞으로 Localizable.string, Assets.xcassets 에 내용을 추가할 때마다 프로젝트 디렉토리에서 `swiftgen`을 호출하면 자동으로 변경사항이 적용됩니다. 

- - -

### **참고자료**
이 내용은 Youtube `Kelvin Fok`의 https://youtu.be/HVtZpywL0HM 의 내용을 참고했습니다.   
12분의 짧은 영상 한번이면 이해가 가능하니 위 내용의 이해가 어려운 경우 꼭 보시는 것을 추천드립니다.

