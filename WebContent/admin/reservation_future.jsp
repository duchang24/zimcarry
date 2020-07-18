<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="bookList" value="${bookDAO.selectBookList(limit, false)}" />
<c:set var="page" value="${util.paging(bookDAO.bookListSize(), 20)}" />

<div class="col-lg-6 col-md-12">
	<div class="card">
		<div class="card-header card-header-warning future">
			<h4 class="card-title">다가오는 예약</h4>
			<p class="card-category">${today}</p>
		</div>
		<div class="card-body table-responsive">
			<table class="table table-hover">
				<thead class="text-warning">
					<tr>
						<th>예약번호</th>
						<th>이름</th>
						<th>경로</th>
						<th>맡기는 일정</th>
						<th>찾는 일정</th>
						<th>리뷰</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${bookList}" varStatus="status">
						<tr>
							<td>${book.bIdx}</td>
							<td>${book.bName}</td>
							<td>${book.bStart} → ${book.bEnd}</td>
							<td>${book.bStartdate}</td>
							<td>${book.bEnddate}</td>
							<td>${book.bIsreview}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page_wrap">
				<ul class="page_list">
					<c:forEach var="i" items="${page}" varStatus="status" >
						<li><a href="./reservation.jsp?btn=future&&pageNum=${status.index + 1}"<c:if test="${status.index + 1 eq pageNum}">class="on"</c:if>>${status.index + 1}</a></li>
					</c:forEach>
			    </ul>
			</div>
		</div>
	</div>
</div>