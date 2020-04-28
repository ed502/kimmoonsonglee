<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="database.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온점</title>
<link rel="stylesheet" href="./resources/css/style.css" />   
</head>
<body>

<%
String word[] = new String[21];
int i=0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		//JDBC 프로그램 순서
		//01단계 :드라이버 로딩 시작
	//	Class.forName("com.mysql.jdbc.Driver")"C:/Users/ralgk/Desktop/Python_iot";
		//01단계 :드라이버 로딩 끝
		try {
			//02단계 :DB연결(Connection)시작
			conn = DBConnection.getConnection();
			//02단계 :DB연결(Connection)끝
			
			// DB 연결이 성공 되었는지 안되었는지 판단하라
			if (conn != null) {
				out.println("01 DB연결 성공");
			} else {
				out.println("02 DB연결 실패");
			}
			//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 시작
			stmt = conn.createStatement();
			//04단계 :Query실행 시작
			String query = "select * from translatelog order by count desc";
			rs = stmt.executeQuery(query);
			//04단계 :Query실행 끝
			//05단계 :Query실행결과 사용
			// 한번 호출되면 밑으로 내려간다. 전체 리스트를 보여줄때는 주석처리 해야 전체 리스트가 나온다.
			//             System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
			//---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 시작 
			while (rs.next()) {
				i++;
				word[i] = rs.getString("word");
	%>

	<%
		/* out.println(rs.getString("m_id") + "<-- m_id 필드=컬럼 값 in tb_member테이블 <br>");
				    out.println(rs.getString("m_pw") + "<-- m_pw 필드=컬럼 값 in tb_member테이블 <br>");
				    out.println(rs.getString("m_level") + "<-- m_level 필드=컬럼 값 in tb_member테이블 <br>");
				    out.println(rs.getString("m_name") + "<-- m_name 필드=컬럼 값 in tb_member테이블 <br>");
				    out.println(rs.getString("m_email") + "<-- m_email 필드=컬럼 값 in tb_member테이블 <br><br>"); */
			}
			//---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 끝

		} catch (SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			// 6. 사용한 Statement 종료
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException ex) {
				}

			// 7. 커넥션 종료
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	%>
       <form method="post" action="index.jsp">

		<p>
			<input type="submit" value="Home">
	</form>



    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4"><h1>온점</h1></div>
            <div class="col-md-4"><h2>시각장애인을 위한 점자 교육 시스템</h2></div>
        </div>
        <br>
        <section class="widget">
            <div class="widget-body">
                <div class="settings-navbar">
                    <ul>
                        <li>
                            <a routerlinkactive="active" href="">
                                점자란?
                            </a>
                        </li>
                        <li>
                            <a routerlinkactive="active" href="ranking.html" class="active">
                                점자랭킹
                            </a>
                        </li>
                        <li>
                            <a routerlinkactive="active" href="">
                                점자퀴즈결과
                            </a>
                        </li>
                        <li>
                            <a routerlinkactive="active" href="">
                                점자게시판
                            </a>
                        </li>
                    </ul>
                    <ul style="margin-top: 32px">
                        <label>
                            <b>졸업작품 정보</b>
                        </label>
                        <li>
                            <a routerlinkactive="active" href="">
                                GitHub
                            </a>
                        </li>
                        <li>
                            <a routerlinkactive="active" href="">
                                졸업작품 개요
                            </a>
                        </li>
                        <li>
                            <a routerlinkactive="active" href="">
                                점자협회
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="settings-container">
                    <settings-section>
                        <div> <h3 style="text-align: center;">많이틀린 점자랭킹</h3> </div>
                        <div class="ranking_box">
                            <div class="list_group">
                                <ul class="ranking_list">
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">1</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title"><% out.println(word[1]); %></span>
                                        <span class="item_title_sub">
                                            양팡 집
                                        </span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">2</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title"><%out.println(word[2]); %></span>
                                        <span class="item_title_sub">
                                            미쓰백 결말, 
                                            영화 미쓰백
                                        </span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">3</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title"><%out.println(word[3]); %></span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">4</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">엣지 오브 투모로우</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">5</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">안나푸르나</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">6</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">청하</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">7</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">전두환</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">8</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">대니쉬 걸</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">9</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">대통령 중임제</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">10</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">알포인트</span>
                                        <span class="item_title_sub">
                                            알포인트 해석
                                        </span>
                                    </span>
                                    </div>
                                    </li>
                                </ul>
                                <ul class="ranking_list">
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">11</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">노베나 디아볼로스</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">12</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">고은아</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">13</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">2020근로장려금 신청기간</span>
                                        <span class="item_title_sub">
                                            근로장려금 자격요건, 
                                            근로장려금, 
                                            2020자녀장려금 신청자격
                                        </span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">14</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">멜론차트</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">15</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">아이유 슈가</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">16</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">오마이걸</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">17</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">구혜선</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">18</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">오징어 외계인</span>
                                    </span>
                                    </div>
                                    </li>
                                
                                
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">19</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">금고</span>
                                    </span>
                                    </div>
                                    </li>
                                
                        
                                    <li class="ranking_item">
                                    <div class="item_box">
                                    <span class="item_num">20</span>
                                    <span class="item_title_wrap">
                                    <span class="item_title">반서진</span>
                                    </span>
                                    </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </settings-section>
                </div>
            </div>
        </section>
    </div>
    <div class="footer">
        <hr>
        <div>
            <div class="card">
                <div>
                    <blockquote class="blockquote mb-0">
                        <h2 style="text-align: center; margin-top: 20px !important;">Developer</h2>
                        <h2 style="text-align: center; margin-top: 20px !important;">2015154009 김학진 2015154014 문준혁 2015154021 송민욱 2015154027 이세민</h2>
                        <footer class="blockquote-footer"  style="text-align: left !important;">
                            <cite title="Source Title">한국산업기술대학교 컴퓨터공학부</cite>
                        </footer>
                    </blockquote>
                </div>
                <div class="card-header">
                    <h5 class="content">Copyright © 온점.All right reserved</h5>
                </div>
            </div>
        </div>
    </div>
</body>

</html>