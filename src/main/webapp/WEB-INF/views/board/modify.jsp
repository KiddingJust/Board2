<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

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
<!-- End Navbar -->
<div class="panel-header panel-header-sm"></div>
<div class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h5 class="title">Modify</h5>
				</div>

				<div class="card-body">
						
						<form id='modiForm'>
							<input type='hidden' name='bno' value='${board.bno}'>
							<input type='hidden' name='page' value='${pageObj.page}'>						
						
						<div class="row">
							<div class="col-md-5 pr-1">
								<div class="form-group">
									<label>Title</label> <input type="text" class="form-control"
										name="title" value='<c:out value="${board.title}"/>'>
								</div>
							</div>
							<div class="col-md-3 px-1">
								<div class="form-group">
									<label>Username</label> <input type="text" name="writer"
										class="form-control" value='<c:out value="${board.writer}"/>'
										readonly=readonly>
								</div>
							</div>
							<div class="col-md-4 pl-1">
								<div class="form-group">
									<label for="exampleInputEmail1">registered day</label> <input
										type="email" class="form-control"
										value='<c:out value="${board.regdate}"/>' readonly=readonly>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Contents</label> <input type="text" name="content"
										textarea rows="5" class="form-control"
										value='<c:out value="${board.content}"/>' style="height: 40vh">
								</div>
							</div>
						</div>


             	 	


<div class="row">
							<div class="col-md-12">
									<div class='uploadDiv'>
										<input type="file" name="uploadFile" multiple>
									</div>
									<div>
									<div class='uploadResult'>
										<ul>
										</ul>
									</div>
									</div>
									<button id = 'uploadBtn'>upload</button>
							</div>
						</div>


						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>About Me</label>
									<textarea rows="1" cols="80" class="form-control"
										readonly=readonly>건전한 게시판 문화를 위해 남을 비방하는 말을 적지 않도록 합시다</textarea>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-2" style="float: right">
								<div>
									<button id="modifyBtn" class="btn btn-primary btn-block">Modify</button>
								</div>
							</div>
					</form>
					
					
							<div class="col-md-2" style="float: right">
								<div>

										<button id=deleteBtn class="btn btn-primary btn-block">Delete</button>
								</div>
							</div>
						<div class="col-md-2" style="float: right">
							<div>
								
									<button id="cancelBtn" class="btn btn-primary btn-block"
										style="background-color: lightgray">cancel</button>
							</div>
						</div>
				
					</div>
			</div>
		</div>
	</div>

</div>
<form id='actionForm'>
	<input type='hidden' name='page' id='page' value=${pageObj.page}>
	<input type='hidden' name='bno' id='bno' value=${pageObj.bno}>
	
	
</form>
	<%@include file="../includes/footer.jsp"%>


<script>
	$(document).ready(function(e){
		
		
		(function(){
			var bno = '<c:out value="${board.bno}"/>';
			$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, attach){
					
					//image type
					if(attach.fileType){
						var fileCallPath = encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
						str += " data-filename='"+attach.fileName+"' data-type='" +attach.fileType+"' ><div>";
						str += "<span> "+ attach.fileName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str + "</li>";
					}else{
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
						str += " data-filename='"+attach.fileName+"' data-type='" +attach.fileType+"' ><div>";
						str += "<span> "+ attach.fileName + "</span><br/>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/resources/img/attach.png'></a>";
						str += "</div>";
						str + "</li>";
					}
				});
				
				$(".uploadResult ul").html(str);
				
			});//end getJSON
		})(); // end function
  	
		$(".uploadResult").on("click", "button", function(e){
			console.log("delete file");
			
		if(confirm("Remove this file? " )){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
		});
	
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; 
		var uploadResult = $(".uploadResult ul");

		function checkExtension(fileName, fileSize){
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false
			}
			
			return true;
		}

		
		$("#uploadBtn").on("click", function(e){
			e.preventDefault();
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			console.log(files);
			
			for(var i = 0; i < files.length; i++){
				
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: "/upload",
				processData: false,
				contentType: false, 
				data: formData,
				type: 'POST',
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType: 'json',
				success: function(result){
					console.log(result);
					
					showUploadedFile(result);
					
				}
			}); // end ajax
		});
		
		
		function showUploadedFile(uploadResultArr) {
			
			if(!uploadResultArr || uploadResultArr.length == 0){return;}
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				
				if(!obj.image) {
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
					
					
					str += "<li "
					str += "data-path='" + obj.uploadPath + "' data-uuid='"+obj.uuid+"' data-filename='" + obj.fileName + "'data-type='"+obj.image+"'><div>";
					str += "<span>" + obj.fileName + "</span>";
					str += "<button type='button data-file=\'"+fileCallPath+"\'data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button></br>";
					str += "<img src='/resources/img/attach.png'></a>";
					str += "</div>";
					str + "</li>";
					
					
					// str += "<li><a href='/download?fileName="+fileCallPath+"'><img src='/resources/img/attach.PNG'>"+obj.fileName+"</a>" +
					//"<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>" + "</li>";

					//str += "<li><img src='/resources/img/attach.png'>" + obj.fileName + "</li>";					
				}else {
					console.log(obj.fileName);
					//str += "<li>" + obj.fileName + "</li>";
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					
					str += "<li data-path='" + obj.uploadPath + "'";
					str += "data-uuid='"+obj.uuid+"' data-filename='" + obj.fileName + "'data-type='"+obj.image+"'"
					str += " ><div>";
					str += "<span>" + obj.fileName +"</span>";
					str += "<button type = 'button' data-file=\'"+fileCallPath+"\'data-type='image' class='btn btn-warning btn-circle'><i class ='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName=" + fileCallPath+"'>";
					str += "</div>";
					str + "</li>";
					
					//str += "<li><a href='/download?fileName="+fileCallPath+"'>" + "<img src='/display?fileName="+fileCallPath+"'></a>"+
							//"<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>" + "</li>";
				}
			});
			uploadResult.append(str);
		};
		
		var csrfHeaderName = "${_csrf.headerName}";
	    var csrfTokenValue = "${_csrf.token}";
		
		//수정버튼
		var actionForm = $("#actionForm");
		var modiForm = $("#modiForm");
		
		$('#modifyBtn').on("click", function(e){
			e.preventDefault();
			e.stopPropagation();
			console.log("submit clicked");
			
			var str = "";
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='" + jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='" + jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='" + jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='" + jobj.data("type")+"'>";
				
			});
		    modiForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>")
			modiForm.append(str);

			modiForm.attr("action", "/board/modify").attr("method", "post").submit();
			console.log(modiForm);
		});
			
		$('#deleteBtn').on("click", function(e){
			e.preventDefault();
		    actionForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>")
			actionForm.attr("action", "/board/remove").attr("method", "post");
			actionForm.submit();
		});//수정 및 기타 버튼 클릭 완료 
		
		$('#cancelBtn').on("click", function(e){
			e.preventDefault();
			actionForm.attr("action", "/board/read").attr("method", "get").submit();
		});
  	});
</script>
</body>


</html>