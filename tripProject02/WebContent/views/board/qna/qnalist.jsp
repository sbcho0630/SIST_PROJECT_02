<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today1" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <link href="../../board/css/board.css" rel="stylesheet"> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
.blist {
	border: 1px grey solid;
	width: 150px;
	height: 400px;
	margin-left: 100px;
	margin-right: 40px;
}

.boardtable {
	border: 0px blue solid;
	margin-left: 0px;
	width: 1000px;
}

 .blist > ul > li {
    display: block;
    height: 40px;
    line-height: 40px;
    padding: 0 30px;
    margin-top: 50px;
     margin-bottom: 50px;
}
</style>
</head>
<body>
	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(../../template/css/img/bg-img/jeju.png)"></div>
	<div class="wrapper row2">
		<div id="services" class="clear">
			<div style="width:1000px;height: 150px;margin-left:300px;">
			<img src="../../board/images/qna.jpg" style="text-align:center;width:100%; height:120px;"/></div>
			<div class="row">
				<div class="blist">
					<h1 class="text-center">커뮤니티</h1>
					<ul>
						<li><a href="notice.do"><h3>공지사항</h3></a></li>
						<li><a href="free.do"><h3>자유게시판</h3></a></li>
						<li><a href="qna.do"><h3>QnA</h3></a></li>
					</ul>
				</div>
				<div class="boardtable">
					<table class="table" style="width: 90%; margin: 0px auto">
						<tr>
							<c:if test="${sessionScope.email!=null }">
								<td><a href="qnainsert.do" class="btn btn-md btn-danger">새글</a>
								</td>
							</c:if>
						</tr>
					</table>
					<table class="table"
						style="width: 90%; margin: 0px auto; table-layout: fixed;">
						<tr style="background-color: #7643ea">
							<th style="width: 50px" class="text-center">번호</th>
							<th style="width: 150px" class="text-center">제목</th>
							<th style="width: 80px" class="text-center">작성자</th>
							<th style="width: 100px" class="text-center">작성일</th>
							<th style="width: 50px" class="text-center">조회수</th>
						</tr>
						<c:forEach var="vo" items="${nlist }" varStatus="status">
							<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"
								var="regdate" />

							<tr style="background-color: #fffee4;">
								<td style="width: 50px" class="text-center"><img
									src="../../board/images/bell.png" /></td>
								<td
									style="width: 150px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"
									class="text-center"><c:if test="${vo.group_tab>0 }">
										<c:forEach var="i" begin="1" end="${vo.group_tab }" step="1">
	  							&nbsp;&nbsp;
	  						</c:forEach>
										<img src="../../board/images/icon_reply.gif">
									</c:if> <c:if test="${today1 == regdate}">
										<img src="../../board/images/new.gif">
									</c:if> <a href="ndetail.do?no=${vo.no }">${vo.subject }<c:if
											test="${countList[status.index] !=0 }">(${countList[status.index] })</c:if></a></td>
								<td style="width: 80px" class="text-center">관리자</td>
								<td style="width: 100px" class="text-center">${regdate }</td>
								<td style="width: 50px" class="text-center">${vo.hit }</td>
							</tr>
						</c:forEach>
						<c:forEach var="vo" items="${list }">
							<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"
								var="regdate" />
							<tr class="qna">
								<td style="width: 50px" class="text-center">${vo.no }</td>
								<td
									style="width: 150px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><c:if
										test="${vo.group_tab>0 }">
										<c:forEach var="i" begin="1" end="${vo.group_tab }" step="1">
	  							&nbsp;&nbsp;
	  						</c:forEach>
										<img src="../../board/images/icon_reply.gif">
									</c:if> <a href="qna_detail.do?no=${vo.no }">${vo.subject }</a> <c:if
										test="${today1 == regdate}">
										<img src="../../board/images/new.gif">
									</c:if></td>
								<td style="width: 80px" class="text-center">${vo.name }</td>
								<td style="width: 100px" class="text-center">${regdate }</td>
								<td style="width: 50px" class="text-center">${vo.hit }</td>
							</tr>
						</c:forEach>

					</table>
					<div style="text-align: center">
			<a href="qna.do?page=${curpage>1?curpage-1:curpage }"
				class="btn btn-md btn-primary">이전</a> ${curpage } page / ${totalpage }
			pages <a href="qna.do?page=${curpage<totalpage?curpage+1:curpage }"
				class="btn btn-md btn-primary">다음</a>
		</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>
