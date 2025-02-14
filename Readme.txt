처음에는 welcome.jsp로 웹페이지를 실행시킨다.
로그인 화면에서 아이디는 admin, 비밀번호는 admin1234
사용하는 데이터베이스 이름은 MovieRateDB
MySQL은 5.7버전 사용
톰캣 9.0버전
localhost:8080
tomcat-users.xml 설정
<role rolename="tomcat"/>
  <role rolename="role1"/>
  <role rolename="admin"/>
  <role rolename="guest"/>
  <user username="tomcat" password="tomcat1234" roles="tomcat"/>
  <user username="both" password="both1234" roles="tomcat,role1"/>
  <user username="role1" password="role1234" roles="role1"/>
  <user username="admin" password="admin1234" roles="admin"/>
  <user username="guest" password="guest1234" roles="guest"/>




![미리보기](https://github.com/CJWJAVAC/MovieRating/raw/master/picture/로그인.png)
