# KREAM_CloneCoding

## 🔎 프로젝트 개요

- **KREAM Clone Coding**은 MVC 패턴을 이용하여 UI 구현 및 데이터 흐름을 학습하기 위한 프로젝트입니다
- UMC 7기 개인 과제 학습용 프로젝트로, **MVC디자인 패턴**, **카카오 로그인**, AutoLayout 등을 학습하고 활용하기 위해 개발했습니다.

## 🔦 프로젝트 목적

- MVC 디자인 패턴의 실제 적용 및 이해
- 다양한 iOS UI 요소 및 레이아웃 학습
- 외부 라이브러리 활용 능력 향상
- 코드 베이스 UI 구현 능력 강화
- OOP와 SOLID 원칙 적용 경험

## 📖 주요 구현 내용

1. **UI 구현**
    - 코드 베이스로 UI 구현 (Then, SnapKit 라이브러리 활용)
    - AutoLayout을 이용한 반응형 레이아웃 구현
2. **디자인 패턴**
    - MVC 패턴 적용
3. **네트워킹 및 데이터 처리**
    - Moya 라이브러리를 이용한 네트워크 통신
    - Kingfisher를 이용한 이미지 로딩 및 캐싱
    - UserDefaults를 이용한 로그인 정보 저장
4. **로그인**
    - 카카오 SDK를 이용한 소셜 로그인 구현

## **⚒️ 기술 스택**

- **프로그래밍 언어** : Swift
- **개발 도구** : Xcode
- **버전 관리** : Git, GitHub
- **아키텍처**
    - MVC 디자인 패턴
- **프레임워크** : `UIKit` (UI 구성)
- **라이브러리**
    - `Then` (코드 간결화)
    - `Kingfisher` (이미지 처리)
    - `SnapKit` (레이아웃)
    - `Moya` (네트워크 통신)
- 외부 SDK : `KakaoOpenSDK` (카카오 로그인)

## 📂 프로젝트 구조

```
📦KREAM_CloneCoding
 ┣ 📂App                           // 앱, 씬 관련 파일
 ┣ 📂Assets.xcassets               // 앱에서 사용하는 이미지 및 색상 리소스
 ┣ 📂Cells                         // 테이블 및 컬렉션 뷰 셀 관련 파일
 ┣ 📂Controllers                   // 뷰 컨트롤러 관련 파일
 ┣ 📂Extension                     // Swift 확장 기능 파일
 ┣ 📂Models                        // 데이터 모델 관련 파일
 ┃ ┣ 📂ResponseModel               // API 응답 모델 파일
 ┃ ┣ 📂ViewData                    // 뷰 데이터 모델 파일
 ┣ 📂Network                       // 네트워크 요청 및 처리 관련 파일
 ┣ 📂Service                       // 데이터 관리 파일
 ┣ 📂Views                         // UI 컴포넌트 및 뷰 관련 파일
 ┃ ┣ 📂Components                  // 재사용 가능한 UI 컴포넌트 파일
 ┣ 📜Config.xcconfig               // 빌드 설정 파일
 ┗ 📜Info.plist                    // 앱의 설정 정보를 담은 파일
```

## 💡 배우고 느낀 점

1. MVC 패턴의 실제 적용
    - MVC 패턴으로 구현해보면서 Model, View, ViewController 간의 데이터 흐름을 이해할 수 있었습니다.
2. 코드 베이스 UI 구현
    - Then을 활용한 코드 간결화 방법, SnapKit을 활용한 효율적인 오토 레이아웃 구현 방법을 습득했습니다.
3. 다양한 UI 컴포넌트 활용 및 재사용
    - UITableView, CollectionView 등의 사용해보면서 셀 재사용을 적용해볼 수 있었습니다.
    - 반복되는 UI 컴포넌트의 추상화 및 재사용 방법을 학습했습니다.
4. 디자인 협업 시뮬레이션
    - Figma 디자인을 바탕으로 UI를 구현해보면서 실제 디자인 협업 과정을 체험했습니다.

## 🎥  화면 구성

### 1. 로그인 화면

![KREAM_Login](https://github.com/user-attachments/assets/f7679eb4-9912-41b0-b4c2-105ef06d8c62)
  
### 2. 홈 화면
![KERAM_Home](https://github.com/user-attachments/assets/5e6bbc2c-6c06-473d-9656-f0d12d39dd3e)
  
### 3. Saved 화면
![KREAM_Saved](https://github.com/user-attachments/assets/dc9f6549-5660-451d-b5d6-777979038522)
  
### 4. 검색 화면
![KREAM_Search](https://github.com/user-attachments/assets/6597b928-5f96-4c13-9ab7-58b97212f564)
  
### 5. 프로필 관리 화면
![KREAM_Profile](https://github.com/user-attachments/assets/fdd06d89-114a-4c9e-9caf-f8ce27ea134e)
