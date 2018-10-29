<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<!-- End Navbar -->
<div class="panel-header panel-header-sm"></div>
<div class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">자유게시판</h4>
				</div>
				<div class="col-md-2" style="float: right">
					<a href="/board/register"><button class="btn btn-primary btn-block">Register</button></a>
                </div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<thead class=" text-primary">
								<th>No.</th>
								<th>Title</th>
								<th>Writer</th>
								<th>Hits</th>
								<th class="text-right">Registered Date</th>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="board">
									<tr>
										<td><c:out value="${board.bno}" /></td>								
										<td><a href='${board.bno}' class='board'><c:out
													value="${board.title}" /></a>
										<c:out value="${board.likenum}" />
										<c:out value="${board.hatenum}" />	
										</td>
										<td><c:out value="${board.writer}" /></td>
										<td><c:out value="${board.readnum}" /></td>
										<td class="text-right"><fmt:formatDate
												value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss " /></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if test="${pageObj.prev}">
								<li class="page-item"><a class="page-link" href="${pageObj.start - 1}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
										</a></li>								
								</c:if>
							
								<c:forEach begin="${pageObj.start}" end="${pageObj.end}" var="num" >	
									<li class="page-item"><a class="page-link" data-page="${num}" href="${num}"><c:out value="${num}" /></a></li>
								</c:forEach>
							
								<c:if test="${pageObj.next}">						
								<li class="page-item"><a class="page-link" href="${pageObj.end + 1}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>	
										<span class="sr-only">Next</span>
										</a></li>
								</c:if>
															
							</ul>

						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form id = 'actionForm'>
	<input type='hidden' name='page' id='page' value=${pageObj.page}>
</form>

<%@include file="../includes/footer.jsp"%>

<script>

$(document).ready(function(){
	
	var pageNum = ${pageObj.page};
    var actionForm = $("#actionForm");

	//버튼 누르면 반응하도록(색깔 바뀌거나, 굵어지거나 둘 중 하나 실행되도록. 그런데 SB에 없으므로 일단 생략)
	$(".pagination li a[data-page="+pageNum+"]").css("color", "darkorange");
	
	//해당 페이지로 이동하도록 설정
	$(".pagination li a").on("click", function(e){
		
		//기본 동작이 실행되면 board/3로 이동하므로 이 작업을 미리 막아주어야 함. 
		e.preventDefault();
		
		var target = $(this).attr("href");
		console.log("target:     " + target);
		$("#page").val(target);
				
		actionForm.attr("action", "/board/list").attr("method", "get").submit();
	});
	
	
});


</script>


</body>

</html>