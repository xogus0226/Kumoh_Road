# Kumoh_Road
플러터로 구현한 학생들이 학교로 편하게 올 수 있도록 하는 앱

# 협업 규칙
커밋을 작성할 때 필히 다음 태그를 이름 앞에 붙여주세요.
- [INITIAL] : repository를 생성하고 최초에 파일을 업로드 할 때
- [ADD] : 신규 파일 추가
- [UPDATE] : 코드 변경이 일어날때
- [REFACTOR] : 코드를 리팩토링 했을때
- [FIX] : 잘못된 링크 정보 변경, 필요한 모듈 추가 및 삭제
- [REMOVE] : 파일 제거
- [STYLE] : 디자인 관련 변경사항
# Naming Convention
- 파일명 규칙
  - 파일명은 기본적으로 스네이크케이스로 작성한다. : snake_case
- 변수명 규칙
  = 변수명은 기본적으로 카멜케이스로 작성한다. : camelCase
- 클래스명 규칙
  - 클래스명은 기본적으로 파스칼케이스로 작성한다. : PascalCase
   
    
# 폴더 구조
참고 : https://couldi.tistory.com/34
- assets 폴더 : 이 폴더는 프로젝트 수준에 위치한다. 그 안에 fonts, images, logo 등의 세부 폴더들이 위치할 수 있으며, 앱에서 사용할 asset들을 모아두는 폴더라 생각하면 된다.
- screens 폴더 : 화면의 UI들을 보관하는 폴더로, 특정 기능마다 화면 분류가 필요해 질 경우, 세부적으로 폴더들을 더 둘수 있다.
- widgets 폴더 : 이것도 UI를 담당하는 위젯들을 모아두는 폴더이다. screens 폴더와의 차이라고 한다면, screens폴더가 화면 전반을 담당한다면, widgets은 그 화면의 부분부분의 요소들 중 재사용되는 UI들을 모아둔 곳이라고 보면 된다.
- utilities 폴더 : 앱에서 사용하는 function이나 logic을 모아두는 폴더이다. 
- providers 폴더 : 이 폴더에는 앱 외부의 다른 서비스들과 앱을 연결할때 사용하는 내용들을 정리해준다.
- models 폴더 : 데이터베이스와 데이터를 주고받기 위해 사용하는 파일들을 모아두는 폴더이다.

  
