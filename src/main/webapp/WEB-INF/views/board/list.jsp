<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../resources/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Now UI Dashboard by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../resources/assets/css/now-ui-dashboard.css?v=1.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../resources/assets/demo/demo.css" rel="stylesheet" />
  

  <link href="../resources/assets/css/c3.css" rel="stylesheet">
  
  
  
</head>

<body class="">
<script src="../resources/assets/js/ds.v5.min.js"></script>
<script src="../resources/assets/js/c3.min.js"></script>


  <div class="wrapper ">
    <div class="sidebar" data-color="orange">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="http://www.creative-tim.com" class="simple-text logo-mini">
          CT
        </a>
        <a href="http://www.creative-tim.com" class="simple-text logo-normal">
          Creative Tim
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="./dashboard.html">
              <i class="now-ui-icons design_app"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li>
            <a href="./icons.html">
              <i class="now-ui-icons education_atom"></i>
              <p>Icons</p>
            </a>
          </li>
          <li>
            <a href="./map.html">
              <i class="now-ui-icons location_map-big"></i>
              <p>Maps</p>
            </a>
          </li>
          <li>
            <a href="./notifications.html">
              <i class="now-ui-icons ui-1_bell-53"></i>
              <p>Notifications</p>
            </a>
          </li>
          <li>
            <a href="./user.html">
              <i class="now-ui-icons users_single-02"></i>
              <p>User Profile</p>
            </a>
          </li>
          <li class="active ">
            <a href="./tables.html">
              <i class="now-ui-icons design_bullet-list-67"></i>
              <p>Table List</p>
            </a>
          </li>
          <li>
            <a href="./typography.html">
              <i class="now-ui-icons text_caps-small"></i>
              <p>Typography</p>
            </a>
          </li>
          <li class="active-pro">
            <a href="./upgrade.html">
              <i class="now-ui-icons arrows-1_cloud-download-93"></i>
              <p>Upgrade to PRO</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg fixed-top navbar-transparent  bg-primary  navbar-absolute">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo">Table List</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
			<div>
			<select name="search">
               <option value="tcw" ${pageObj.type == "tc" ? "selected":""}>전체</option>
               <option value="t" ${pageObj.type == "t" ? "selected":""}>제목</option>
               <option value="w" ${pageObj.type == "w" ? "selected":""}>작성자</option>
               <option value="c" ${pageObj.type == "c" ? "selected":""}>내용</option>
               <option value="tc" ${pageObj.type == "tc" ? "selected":""}>제목+내용</option>
               <option value="tw" ${pageObj.type == "tc" ? "selected":""}>제목+작성자</option>
               <option value="cw" ${pageObj.type == "tc" ? "selected":""}>작성자+내용</option>
               
            </select>
			</div>
			<div class="col-md-3">
              <div class="input-group no-border" >
                <input name = searchText type="text" value="${pageObj.keyword}" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i id = searchBtn class="now-ui-icons ui-1_zoom-bold"></i>
                  </div>
                </div>
              </div>
              </div>
            <ul class="navbar-nav">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="now-ui-icons location_world"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
              
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="now-ui-icons users_single-02"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Account</a>
					
				  <form action="/customLogout" method='post'>
				  <input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>
                  <a href="/customLogout" class="dropdown-item">Logout</a>
                  </form>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      
<!-- End Navbar -->
<div class="panel-header panel-header-sm"></div>
<div class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">	
					<h4 class="card-title">Free Board</h4>
					
									<div id="chart"></div> //출력
					
					<div>
				<select id="select"floa>
               <option value="10" ${pageObj.display == 10 ? "selected":""}>10</option>
               <option value="20" ${pageObj.display == 20 ? "selected":""}>20</option>
               <option value="50" ${pageObj.display == 50 ? "selected":""}>50</option>
               <option value="100" ${pageObj.display == 100 ? "selected":""}>100</option>
            	</select> 
					</div>

				      
				      
				<div class="col-md-2" style="float: right">

					<button class="btn btn-primary btn-block" id="registerBtn">Register</button>
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
	<input type='hidden' name='display' id='display' value='${pageObj.display}'>
	<input type='hidden' name='type' value='${pageObj.type}'>
 	<input type='hidden' name='keyword' value='${pageObj.keyword}'>
</form>

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>

$(document).ready(function(){
	    
    var chart = c3.generate({ 
        bindto: '#chart',
        data: {
          columns: [
            ['data1', 10, 20, 30, 40, 50, 60],
            ['data2', 200, 10, 150, 20, 100, 30]
          ],
          axes: {
            data2: 'y2' // ADD
          }
        },
        axis: {
          y2: {
            show: true // ADD
          }
        }
    });
    
    
    function drawChart(){
    	var jsonData = $.ajax({
    		url: "/board/list",
    		type: "post",
    		dataType: "json",
    		async: false
    	}).responseText;
    	
    	var data = new google.visualization.DataTable(jsonData);
    	
    	var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    	chart.draw(data, {width: 400, height: 240});
    }
    
    
	//Modal 실행
    var result = '<c:out value="${result}"/>';
    checkModal(result);
    history.replaceState({}, null, null);
    
    function checkModal(result){
       if(result === ''||history.state){
          return;
       }
       if (result === 'SUCCESS') {
    		nowuiDashboard.showNotification('top','center');
    	} 
 	}
	
  	//searchbox 코드
	$("#searchBtn").on("click", function(e){
		
		var searchTypeValue = $("select[name='search'] option:selected").val();
		console.log(searchTypeValue);
		
		var searchKeyword = $("input[name='searchText']").val();
		console.log(searchKeyword);
		
		if(searchKeyword.trim().length == 0 ){
			alert("검색어 없음");
			return;
		}
		
		actionForm.attr("action","/board/list");
		actionForm.find("input[name='type']").val(searchTypeValue);
		actionForm.find("input[name='keyword']").val(searchKeyword);
		$("#page").val(1);
		
		actionForm.submit();
	});
	
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
	
    //게시판 제목 클릭하기
    $(".board").on("click",function(e){
       e.preventDefault();
       var bno = $(this).attr("href");
       actionForm.append("<input type='hidden' name='bno' value='"+bno+"'>");
       actionForm.attr("action", "/board/read")
       .attr("method", "get").submit();

    });
    
    //register
    $("#registerBtn").on("click",function(e){
       e.preventDefault();
       actionForm.attr("action", "/board/register")
       .attr("method", "get").submit();
    });
	
    //selectbox 코드
    $('#select').change(function(e){
       
      e.preventDefault();
      
        var display = $(this).val();
      $("#display").val(display);
      
       actionForm.attr("action", "/board/list")
       .attr("method", "get").submit();
       
    });
});


</script>


</body>

</html>