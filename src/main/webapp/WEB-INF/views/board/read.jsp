<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>


      <!-- End Navbar -->
      <div class="panel-header panel-header-sm">
      </div>
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h5 class="title">Register</h5>
              </div>
                            
              <div class="card-body">
              
                  <div class="row">
                    <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label>Title</label>
                        <input type="text" class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly="readonly">
                      </div>
                    </div>
                    <div class="col-md-3 px-1">
                      <div class="form-group">
                        <label>Username</label>
                        <input type="text" name="writer" class="form-control" value='<c:out value="${board.writer}"/>'  readonly=readonly>
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">registered day</label>
                        <input type="email" class="form-control" value='<c:out value="${board.regdate}"/>' readonly=readonly>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Contents</label>                        
                        <input type="text" name="content" textarea rows="5" class="form-control" value='<c:out value="${board.content}"/>' readonly=readonly style="height:40vh">
                      </div>
                    </div>
                  </div>
                  
                               	 		<div class="row">
							<div class="col-md-12">
             	 	<div class='bigPictureWrapper'>
             	 	<div class='bigPicture'>
             	 	</div></div>
             	 	
             	 	<style>
             	 	.uploadResult {
             	 		width:100%;
             	 		background-color:gray;
             	 	}
             	 	.uploadResult ul{
             	 		display: flex;
             	 		flex-flow: row;
             	 		justify-content: center;
             	 		align-items: center;
             	 	}
             	 	.uploadResult ul li {
             	 		list-style: none;
             	 		padding: 10px;
             	 		align-content: center;
             	 		text-align: center;
             	 	}
             	 	.uploadResult ul li img{
             	 		width: 100px;
             	 	}
             	 	.uploadResult ul li span {
             	 		color:white;
             	 	}
             	 	.bigPictureWrapper {
             	 		position: absolute;
             	 		display: none;
             	 		justify-content: center;
             	 		align-items: center;
             	 		top: 0%;
             	 		width: 100%;
             	 		height: 100%;
             	 		background-color: gray;
             	 		z-index: 100;
             	 		background:rgba(255, 255, 255, 0.5);
             	 	}
             	 	.bigPicture {
             	 		position: relative;
             	 		display:flex;
             	 		justify-content: center;
             	 		align-items: center;
             	 	}
             	 	.bigPicture img{
             	 		width:600px;
             	 	}
             	 	</style>


								<div class='panel panel-default'>
									<div class="panel-heading">Files</div>
									<div class="panel-body">
									<div class='uploadResult'>
										<ul>
										</ul>
									</div>
								</div>
							</div>
						</div>
						</div>
						
             	 
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>About Me</label>
                        <textarea rows="1" cols="80" class="form-control" readonly=readonly>건전한 게시판 문화를 위해 남을 비방하는 말을 적지 않도록 합시다</textarea>
                      </div>
                    </div>
                  </div>
						
				  <form role="form" action="/board/modify" method="get">
						<input type='hidden' name='page' value='${pageObj.page}'> <input
							type='hidden' name='bno' value='${pageObj.bno}'>

						<div class="row">
							<div class="col-md-3" style="float: right">
								<div>
									<button type="submit" class="btn btn-primary btn-block">Modify/Delete</button>
									</a>
								</div>
							</div>
							<div class="col-md-2" style="float: right">
								<div>
									<button id="listBtn" class="btn btn-primary btn-block"
										style="background-color: lightgray">list</button>
									</a>
								</div>
							</div>
						</div>
					</form>
                  

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
  	
  	var actionForm = $("#actionForm");
  	
  	$(document).ready(function(e){
		$("#listBtn").on("click", function(e){
			e.preventDefault();
		    actionForm.attr("action", "/board/list").attr("method", "get").submit();
		});
		
		$(".uploadResult").on("click", "li", function(e){
			console.log("view image");
			
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_" + liObj.data("filename"));
			
			if(liObj.data("type")){
				showImage(path.replace(new RegExp(/\\/g),"/"));
			}else{
				//download
				self.location ="/download?fileName="+path
			}
		});
		
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			}, 1000);
		});
		
		function showImage(fileCallPath){

			$(".bigPictureWrapper").css("display", "flex").show();
			$(".bigPicture")
			.html("<img src='/display?fileName="+fileCallPath+"'>")
			.animate({width: '100%', height: '100%'}, 1000);
		}
		
		(function(){
			var bno = '<c:out value="${board.bno}"/>';
			$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, attach){
					
					//image type
					if(attach.fileType){
						var fileCallPath = encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+
						"'data-filename='"+attach.fileName+"' data-type='" +attach.fileType+"' ><div>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str + "</li>";
					}else{
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+
						"'data-type='"+attach.fileType+"' ><div>";
						str += "<span " + attach.fileName + "</span><br/>";
						str += "<img src='/resources/img/attach.png'></a>";
						str += "</div>";
						str + "</li>";
					}
				});
				
				$(".uploadResult ul").html(str);
			});//end getJSON
		})(); // end function
  	
  	});
  	
 </script>

</body>

</html>