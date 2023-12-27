 <p align="center">
  <img src="https://github.com/Hyeongyu-IM/mmTalkShopping/assets/64323969/9af746aa-228d-4454-92e0-7684b64fe7cc" width="500" height="500">
 </p> 

# 목차
1. [프로젝트 기술 스택](#프로젝트-기술-스택)
2. [프로젝트 의존성 그래프](#프로젝트-의존성-그래프)
3. [프로젝트 아키텍처](#프로젝트-아키텍처)
4. [TestCode](TestCode)
5. [힘들었던 부분](#힘들었던-부분)
6. [소감](#소감)

### 프로젝트 기술 스택

- 프로젝트 관리 도구: Tuist
- 사용한 라이브러리 및 프레임워크
    - Swift, Combine, UIKit
    - SnapKit, Kingfisher, CombineCocoa, CombineDataSource, Then, Apollo
    - Quick, Nimble

### 프로젝트 의존성 그래프

 <p align="center">
<img src="https://github.com/Hyeongyu-IM/mmTalkShopping/assets/64323969/9a07f624-ebfd-4b61-b805-dbfc77286ea2" width="600" height="500">
 </p>

프로젝트는 크게 5부분으로 나누어져 있습니다. DesignSystem관련 모듈을 하나 만들까하다가 너무 구성이 없을 것같아 생략하였습니다

- Core
    - Extension 및 앱에서 사용되는 공통적인 코드가 모두 들어가 있습니다
- Data
    - Data는 Networks에 데이터 요청을 하고 Domain에 넘겨주는 역할을 하고있습니다
- Domain
    - Domain은 App과 UseCase protocol을 통해 소통하며, Data와도 repository protocol을 이용해 소통합니다
- Networks
    - Networks는 Apollo Client를 통해 네트워크 통로를 제공하고, Operation관련 SampleData를 제공합니다
- ThirdPartyLibs
    - 앱에 필요한 여러 의존성들을 관리합니다

### 프로젝트 아키텍처

 <p align="center">
  <img width="600" alt="%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-12-03_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_6 05 31" src="https://github.com/Hyeongyu-IM/mmTalkShopping/assets/64323969/2a791475-cc77-4d77-bc88-a8a68c58dfa4">
 </p>
