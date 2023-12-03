# 코드를 요리하는 iOS 지원자 임현규 입니다

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

### TestCode

 <p align="center">
<img width="600" alt="%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-12-03_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_6 05 31" src="https://github.com/Hyeongyu-IM/mmTalkShopping/assets/64323969/e174753b-fdef-4ad2-964c-a4e40b70f61a">
 </p>

TestCode는 Quick과 Nimble을 사용해서 BDD(Behavior Driven Development) 유저의 행동을 중심으로 ViewModel의 Input, Output을 검증하고자 했습니다. 다른 모듈들도 테스트를 해야하는게 좋지만 ViewModel위주로 작성해 보았습니다.

### 힘들었던 부분

1. Apollo Client
    1. 적용
        
        GraphQL이라는 것은 부끄럽지만 처음 알게 되었습니다.
        
        이게 어떻게 수발신이 이루어지는지 유튜브 영상과 여러 블로그를 통해 학습하는데 꽤 오랜 시간이 걸렸습니다
        
    2. Tuist로 프로젝트에 적용 및 CodeCli를 이용해야하는 부분
        
        잘 사용되지 않는 만큼 참고할수 있는 자료 자체가 적어 Tuist에 적용하는 방법을 찾고, schema를 통해 generate하고 그렇게 나온 SwiftPackage를 또 Tuist에 localPath로 적용하는 부분은 새로운 경험이 되었습니다
        
    3. 테스트 sampleData를 이용하는 것
        
        기존에는 Alamofire, Moya를 통해 테스트 코드를 짯었는데 Apollo를 이용해서 MockObject를 활용해서 하려고 하다보니 __typeName이라는 부분에서 변환하는 로직을 이해하는데 시간이 소요되었습니다
        
2. Tuist 라이브러리 적용관련 문제
    
    Tuist를 통해서 모듈간의 의존성을 맞추다보면 주로 ThirdPartyLibs나 런타임에서 UndefineSymbol 또는 implementBoth가 뜨는 경우가 있어서 dynamic으로 바꾸거나 headerSearchPath를 이용해 해결하였습니다.
    

### 소감

사실 힘들었던 두가지 이유말고는 어려운 부분이 크게 없었습니다. 

이번에 Apollo를 적용했던 이유는 과제문서와 우대사항에도 적혀있어서 회사 실제 프로젝트에는 사용하고 있을수도 있다는 생각에 미리 한번 사용해 보자고 생각하게 되었습니다.
하면 되겠지! 라는 생각이었지만 막상 라이브러리에 추가하고 cli추가, mockData, Scheme추가하는 부분까지 하나하나 한번에 넘어간게 없어 이제라도 돌아가야되나 생각했지만 결국 잘되어서 정말 뿌듯하였습니다.

그리고 우대사항 두가지중 하나였던 UnitTest는 테스터블한 코드가 코드를 작성함에 있어서 가장 중요하다고 생각하기 때문에 과제 요구사항에는 없었지만 작성해보았습니다.

한가지 혼동스러웠던 부분은 과제 선택사항에 뷰 캐시 처리가 있었는데 이부분이 CollectionView dequeueReusable을 뜻하는지 imageCache를 뜻하는지가 좀 모호했었습니다.
이미지 캐시는 KingFiser에서 memoryCache만을 이용하도록 설정해 두었습니다. 쇼핑몰의 상품들은 이미지가 워낙 다채롭고 순서의 변화도 크기때문에 디스크 캐시에 저장해두기 보다는 앱을 끄면 날라가는 메모리가 적절하다고 생각했습니다.

새롭게 GraphQL을 이용하면서 흥미로운 점도 많이 있었고, 백엔드 데이터 모델에 hash값이 있어서 item Hashble을 쉽게 만들수 있는 부분도 너무 좋았습니다.
이번에 하면서 아쉬웠던 점은 ViewControllerBuilder를 사용해 실제 구현체를 참조해야하는 부분을 싱글톤으로 만들게 되었었는데 Coordinator와 화면을 Feature모듈 형태로 나누어서 구현했으면 어땟을까 하는 아쉬움이 있었습니다.
