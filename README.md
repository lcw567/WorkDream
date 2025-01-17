
## 프로젝트 소개
본 프로젝트는 구직자와 기업을 연결하는 통합 채용 플랫폼입니다.    
플랫폼은 구직자와 기업 각각의 니즈를 충족하기 위해 차별화된 서비스를 제공합니다.    
![로고](./front/public/mainlogo.png)

## 프로젝트 기획 의도

현대 사회는 취업과 인재 채용이 동시에 더욱 복잡하고 정교해지고 있습니다. 기업은 적합한 인재를 찾는 데 어려움을 겪고 있으며,    
구직자는 신뢰할 수 있는 채용 정보를 통해 효과적으로 자신의 능력을 홍보할 수 있는 플랫폼을 요구하고 있습니다.     
이러한 요구를 충족하기 위해 본 프로젝트는 구직자와 기업이 하나의 플랫폼에서 서로 효과적으로 연결될 수 있는 시스템을 구축하는 것을 목표로 합니다.    

이 플랫폼은 구직자의 이력서, 자기소개서, 포트폴리오 관리 기능과 기업의 채용 공고 등록 및 지원자 관리 기능을 지원하며,     
사용자 경험을 최우선으로 고려한 직관적이고 편리한 UI/UX를 제공합니다. 또한, 커뮤니티 기능을 통해 사용자가 정보와 경험을 공유하고 소통할 수 있는 장을 마련하여 취업 정보의 신뢰성과 사용자 참여도를 높이고자 합니다.    


## 개발 기간 
2024-10-15 ~ 2024-12-13


## 기술 스택
`Front-End` 

<img src="https://img.shields.io/badge/Next.js-000000?style=flat-square&logo=Next.js&logoColor=white"/>
<img src="https://img.shields.io/badge/Typescript-3178C6?style=flat-square&logo=Typescript&logoColor=white"/>
<img src="https://img.shields.io/badge/ReactQuery-FF4154?style=flat-square&logo=ReactQuery&logoColor=white"/>
<img src="https://img.shields.io/badge/Recoil-black?style=flat-square&logo=Recoil&logoColor=white"/>
<img src="https://img.shields.io/badge/styledcomponents-DB7093?style=flat-square&logo=styled-components&logoColor=white"/>
<img src="https://img.shields.io/badge/Axios-5A29E4?style=flat-square&logo=Axios&logoColor=white"/>
<img src="https://img.shields.io/badge/ReactHookForm-EC5990?style=flat-square&logo=ReactHookForm&logoColor=white"/>


`Back-end`

<img src="https://img.shields.io/badge/Nest.js-E0234E?style=flat-square&logo=Nestjs&logoColor=white">
<img src="https://img.shields.io/badge/Typescript-3178C6?style=flat-square&logo=Typescript&logoColor=white"/>
<img src="https://img.shields.io/badge/mysql-4479A1?style=flat-square&logo=mysql&logoColor=white">

`Communication`
<img src="https://img.shields.io/badge/notion-000000?style=flat-square&logo=notion&logoColor=white">
<img src="https://img.shields.io/badge/github-181717?style=flat-square&logo=github&logoColor=white">

## 사용 라이브러리및 API
-
-
-
-
-

## 실행 방법

1. 프로젝트 레포지토리를 클론합니다.

```sh
$ git clone https://kdt-gitlab.elice.io/ai_track/class05/ai_project/team05/team05.git
```

2. 프로젝트 실행에 필요한 패키지를 설치합니다.

```sh
$ cd front
$ npm i

$ cd back
$ npm i
```

3. development server을 실행합니다.
```sh
$ npm run dev
# or
$ yarn dev
```

## 주요 기능

### ✏ 소중한 사람과 **공용 일기장**을 만들어 서로의 일상을 공유할 수 있어요.  
  <img src="" height="300">
  <img src="" height="300">
  <img src="" height="300">
  <img src="" height="300">

+ 마이페이지
  + 유저 코드를 입력하여 친구 요청
  + 알림을 통해 친구 요청을 수락하거나 거절
  + 수락 시 공용 일기장 생성
  + 일기장 이름 수정 가능

+ 교환일기
  + 월 별 일기 기록 제공
  + 정확한 감정 분석을 위해 일기 작성은 당일 한 번만 가능 (수정 및 삭제 불가능)
  + 일기 작성 시 자동으로 감정을 분석
  + 일기 작성 당일 자정이 지나는 시점에 기분 전환할 수 있는 활동을 추천
+ 홈
  + 분석된 감정 기록을 캘린더 형태로 제공 (나 & 상대방)

### 📌 추천받은 활동을 포함한 사용자의 일정을 **투두 리스트**로 관리할 수 있어요.   
  <img src="" height="300">
  <img src="" height="300">

+ 일정 관리
  + 추천받은 활동은 자동으로 투두 리스트에 추가
  + 사용자가 직접 투두 리스트 생성, 수정, 삭제 가능
  + 월 별로 일정을 보여 줌
  + 완료 표시 가능

### ⚙ 내 정보를 간편하게 관리할 수 있어요.
  <img src="/" height="300">
  <img src="/" height="300">
  
+ 마이페이지
  + 닉네임, 비밀번호, 일기장 이름 수정 가능
  + 최적화된 활동 추천을 위한 관심 분야 설정 가능
  + 연결 끊기, 회원 탈퇴 가능

## 부가 기능

* 소셜 로그인 (카카오)
* 반응형 웹 디자인
* react-error-boundary 사용하여 폴백 UI로 에러 화면 구성
* 전역 style 정의하여 라이트/다크 모드 구현

## 팀원 소개

| 이름 | 포지션 | Contact |
| --- | --- | --- |
| 최지원 | AI | a1@gmail.com |
| 최지투 | BE | a1@gmail.com |
| 최지삼 | FE | a1@gmail.com |
| 최지사 | FE | a1@gmail.com |
| 최지오 | FE | a1@gmail.com |
