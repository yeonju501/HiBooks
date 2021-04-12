# HiBooks
Final Project in BitCamp, modeling Book shop website.

## 개요

 - [개발 일지(벨로그)] https://velog.io/@betweenhj702?tag=Final-PJ
 - [시연 영상] https://www.youtube.com/watch?v=RzMbMxom7Eo
 
[![시연 영상](https://img.youtube.com/vi/RzMbMxom7Eo/0.jpg)](https://www.youtube.com/watch?v=RzMbMxom7Eo)
 
 - 기간 - 50일
 - 인터넷 서점 - 책 구매 서비스 제공 웹 개발 프로젝트
 - 프젝 구성원 - 신동오, 권연주, 박진호
 - 주제 선정 이유 - 많은 양의 데이터베이스를 기반으로 추천 서비스를 구현하기에 책이라는 주제가 적합하다고 생각하였음.
 - 활용 기술 
   * Java 1.8, Spring Framework 5.0.7, Mybatis, Hikari CP, Spring Security, JSOUP, KOMORAN ....
   * Tomcat9, Oracle, STS3, VS code, Git Desktop, Git gui
   * html5, css, Javascript, jquery, ajax, bootstrap
   
## 논리적, 물리적 모델링
<!--![회원, 책 테이블](https://user-images.githubusercontent.com/75344320/114050646-6bd58000-98c7-11eb-945f-3dcf292d5b77.PNG)![게시판 테이블](https://user-images.githubusercontent.com/75344320/114050624-65470880-98c7-11eb-8022-a3f095416ec9.PNG)![구매 테이블](https://user-images.githubusercontent.com/75344320/114050662-6ed07080-98c7-11eb-8544-ee56663a08f4.PNG)-->
 - 회원, 책 테이블
<img src="https://user-images.githubusercontent.com/75344320/114050646-6bd58000-98c7-11eb-945f-3dcf292d5b77.PNG" width="600px">
 
 - 구매 로직 테이블
<img src="https://user-images.githubusercontent.com/75344320/114050662-6ed07080-98c7-11eb-8544-ee56663a08f4.PNG" width="600px">
 
 - 게시판 테이블
<img src="https://user-images.githubusercontent.com/75344320/114050624-65470880-98c7-11eb-8022-a3f095416ec9.PNG" width="600px">

## 책 데이터 베이스 구성 과정 및 결과물

* 초기 기획 방안
  - 처음 계획은 알라딘 api를 가져와 BOOK 테이블에 입력하려고 함.
  - 책 소개 데이터를 이용하여 추천 서비스를 구현하려고 하였는데, 알라딘 api 에서는 책 소개 데이터를 제공하지 않았음.

* 데이터 크롤링
  - 다른 적합한 사이트를 크롤링하여 원하는 책 소개 데이터를 가져오기로 함.
  - JSOUP 라이브러리를 이용하기로 하였고, 크롤링하기 용이하고 원하는 데이터를 가져올 수 있는 '리디북스' 홈페이지를 선정함.
  - JDBC와 JSOUP를 이용하여 데이터베이스에 크롤링한 데이터를 입력할 수 있는 JAVA APP을 만듦.

* 추천 서비스 구현 
  - 추천 서비스를 구현하기 위해 머하웃 라이브러리를 구글링하였는데 생각했던 것과는 달리 사용자와 구매내역에 대한 대량의 데이터가 필요하다는 것을 알게 됨.
  - 전통적인 추천 방식인 '내용기반 추천 서비스'를 구현하는 것으로 합의함.
  - 이를 위해 처음에 입력했던 책 소개 데이터를 따로 가공하여 추천 서비스를 위한 컬럼을 만들기로 함.
  - KOMORAN 라이브러리를 이용하여 책 소개 데이터에서 명사만 추출하여 세부카테고리 데이터와 합쳐, 키워드 데이터를 만들고, 이를 기존의 책 DB 입력 APP에 추가하여 한번에 입력되도록 하였음.

* 신간 데이터 추가 
   - 완성된 APP을 좀더 활용할 방법을 찾다가 리디북스에 올라온 신간 데이터를 추가하기로 함.
   - APP을 웹 프로젝트 내부로 옮겨 컴포넌트화 하여 스케쥴러로 한달에 한 번 실행하여 신간 데이터를 추가함. 

* 결과물
  - 책 데이터 베이스
  	![책 크롤링 결과-1](https://user-images.githubusercontent.com/75344320/114350906-d545df00-9ba4-11eb-89d6-92730688b38f.PNG)
	![책 크롤링 결과-2](https://user-images.githubusercontent.com/75344320/114350913-d7a83900-9ba4-11eb-9e5f-f6eef12add70.PNG)

  - 내용기반 추천 서비스 : 키워드 데이터에서 세부카테고리 데이터의 마지막 카테고리와 중요 키워드 3개를 추가하여 하나의 책에 유사한 책 8개를 리스팅함.
  	
	```xml
  	<select id="selectRecommendList" parameterType="ContentVo" resultType="Book">
			select ROWNUM, b.* from (select * from book where B_CATE= #{b_cate} and not B_ITEMID = #{b_itemId} and
			    (B_KEYWORD like '%'||#{keyword1}||'%' or
			    B_KEYWORD like '%'||#{keyword2}||'%' or
			    B_KEYWORD like '%'||#{keyword3}||'%' and
			    B_KEYWORD like '%'||#{keyword4}||'%' and
			    B_KEYWORD like '%'||#{keyword5}||'%')
			    order by b_seq) b
			    where ROWNUM &lt;= #{number}
	 </select>
	  ```
  
  <img src="https://user-images.githubusercontent.com/75344320/114346284-2b635400-9b9e-11eb-8ea7-f452d05fc3a4.PNG" width="400px"><img src="https://user-images.githubusercontent.com/75344320/114348103-0cb28c80-9ba1-11eb-9cb5-569bb6c20f9d.PNG" width="400px">
  
  - 신간 업데이트
  	```java
		package bit.hibooks.java.app;
		import org.springframework.scheduling.annotation.Scheduled;
		import org.springframework.stereotype.Component;
			
		@Component
		public class BookDataUserNew {
	
			@Scheduled(cron = "0 0 0 1 * *")
			public void updateBook() {
				BookDataManager bdm = new BookDataManagerSec();
				String urlNovel = "https://ridibooks.com/category/new-releases/100?&page=";	// 선택한 카테고리 url 지정(리스트 페이지)
				String urlEconomy = "https://ridibooks.com/category/new-releases/200?page=";
				String urlSociety = "https://ridibooks.com/category/new-releases/400?page=";
				String urlSelf = "https://ridibooks.com/category/new-releases/300?page=";
				String urlEssay = "https://ridibooks.com/category/new-releases/110?page=";
				int pageNum = 1;
				while(true) {
					bdm.insertItemInfo(urlNovel, pageNum, 100);
					bdm.insertItemInfo(urlEconomy, pageNum, 200);
					bdm.insertItemInfo(urlSociety, pageNum, 300);
					bdm.insertItemInfo(urlSelf, pageNum, 400);
					bdm.insertItemInfo(urlEssay, pageNum, 500);
					if(pageNum == 1) break;	// 페이지 넘버를 지정( 리스트 한 페이지에 20개의 책 )
				}
			bdm.closeCon();
			}
		}
	```
  
## 스프링 시큐리티 적용과정 및 결과물
* 기존의 회원가입, 로그인 서비스에 시큐리티 라이브러리를 적용함.
* 시큐리티 설정은 xml을 이용하고, UserDetails 와 UserDetailsService 인터페이스를 커스터마이징하여 프로젝트에 적용하였음.
* 적용 내용
	- 회원가입시 bcrypt 클래스를 이용한 비밀번호 암호화.
	- 시큐리티에서 Authentication 에 필요한 Enabled 변수를 이용하여 회원가입시 이메일 인증을 구현함.
	- Authentication 를 이용한 로그인.
	- Authority 를 이용한 페이지 또는 서비스 접근권한 설정.
* 아쉬운 점
	- 관리자 계정을 따로 테이블을 만들지 못하고, xml에서 임의의 계정을 설정하여 보안에 취약한 점.
	- 그로 인해 Authority 를 제대로 활용하지 못함.

## 관리자 페이지 구현
* 
## 웹페이지의 자바스크립트 구현(AJAX 및 페이지 동적 처리)
  
  
