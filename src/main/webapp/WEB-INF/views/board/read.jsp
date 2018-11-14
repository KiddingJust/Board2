<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

             	 	<style>
             	 	.uploadResult {
             	 		width:100%;
             	 		border: 1px solid lightgray;
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

      <!-- End Navbar -->
      <div class="panel-header panel-header-sm">
      </div>
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h5 class="title">Read</h5>
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
				<br/>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="now-ui-icons ui-1_send"></i> <strong class='primary-font'>댓글</strong>
						</div>
						<div class="panel-body">
							<ul class="chat">
								<li class="left clearfix" data-rno='3'>
									<div>
										<div class="header">
											<strong class="primary-font"></strong>
											<small class="pull-right text-muted"></small>
										</div>
										<p></p>
									</div>
								</li>
							</ul>
							 <button id="addReplyBtn" class="btn btn-primary btn-block" style="background-color: lightgray"
							 button type="button" data-toggle="modal" data-target="#myModal">댓글쓰기</button>
						</div>
						<div class="paging">
				
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


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header" style="float: left">
               <h3 class="modal-title" id="myModalLabel" >댓글 작성</h4>
            </div>
            <div class="modal-body">
        
            <div class="form-group">
            	<label>내용</label>
            	<input class="form-control" name="reply" value="New 댓글!!!">
            </div>
            <div class="form-group">
            	<label>작성자</label>
            	<input class="form-control" name="replyer" value='New Reply!!!!'>
            </div>
            <div class="form-group">
            	<label>작성 날짜</label>
            	<input class="form-control" name="regDate" value="New 댓글!!!">
            </div>
            </div>
            
            <div class="modal-footer">
            
               <sec:authentication property="principal" var="pinfo"/>
						
        	 	<button id="modalModBtn" type="button" class="btn btn-primary" data-dismiss="modal">수정하기</button>
           		<button id="modalRemoveBtn" type="button" class="btn btn-primary" data-dismiss="modal">삭제하기</button>
                <button id="modalRegisterBtn" type="button" class="btn btn-primary" data-dismiss="modal">등록하기</button>
                <button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">창 닫기</button>
            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->

  </div>
</div>                  
 
 
 
 
 
 
 
 
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

<script type="text/javascript" src="/resources/assets/js/reply.js"></script>
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
  		
  		 var bnoValue = '<c:out value="${board.bno}"/>';
  		 var replyUL = $(".chat");
  	 	 showList(1);
  	 	 
  	 	 function showList(page){
  		 
  	 	 replyService.getList({bno:bnoValue, page: page || 1}, function(dto, list){
  	 		
  	 		 console.log("dto: " + dto);
  	 		 console.log("list: " + list);

  	 		 var str="";
			 
			 if(list == null || list.length == 0){
				 replyUL.html("")
				 
				 return;
			 }
  	 		 for(var i = 0, len = list.length || 0 ; i < len ; i++){
  	 			 str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
  	 			 str += " <div><div class='header'><strong class='primary-font'>" + list[i].replyer+"</strong>";
  	 			 str += "   <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replydate) + "</small>";
  	 			 str += "     <p>" + list[i].reply + "</p></div></div></li>";
  	 		 }
  	 		 replyUL.html(str);
  	 	 }); //end function
  	 	 }// end showList
  	 	 
  	 	 var modal = $(".modal");
  	 	 var modalInputReply = modal.find("input[name='reply']")
  	 	 var modalInputReplyer = modal.find("input[name='replyer']")
  	 	 var modalInputRegDate = modal.find("input[name='regDate']")

  	 	 var modalModBtn = $("#modalModBtn");
  	 	 var modalRemoveBtn = $("#modalRemoveBtn");
  	 	 var modalRegisterBtn = $("#modalRegisterBtn");

  	 	 $("#addReplyBtn").on("click", function(e){
  	 		 
  	 		 modal.find("input").val("");
  	 		 modalInputRegDate.closest("div").hide();
  	 		 modal.find("button[id != 'modalCloseBtn']").hide();
  	 		 
  	 		 modalRegisterBtn.show(); 
  	 		 $(".modal").modal("show");

  	 	 });
  	 	 
  	 	 modalRegisterBtn.on("click", function(e){
  	 		
  	 		 var reply = {
  	 				 reply: modalInputReply.val(),
  	 				 replyer: modalInputReplyer.val(),
  	 				 bno:bnoValue
  	 		 };
  	 		 replyService.add(reply, function(result){
  	 			 alert(result);
  	 		 })
  	 		 modal.find("input").val("");
  	 		 modal.modal("hide");
  	 		 
  	 		 showList(1);
  	 	 });
  	 	 
		$("#listBtn").on("click", function(e){
			e.preventDefault();
			console.log("listBtn clicked....")
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