<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@include file="../includes/header.jsp"%>

<style>
	.uploadResult {
	width: 100%;
	background-color: white;
	}
	
	.uploadResult ul{
	display:flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
	}
	
	.uploadResult ul li {
	list-style: none;
	padding: 10px;
	}
	
	.uploadResult ul li img{
	width: 20px;
	}
	
</style>

<!-- End Navbar -->
<div class="panel-header panel-header-sm"></div>
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
									<label>Title</label> <input type="text" name="title"
										class="form-control" placeholder="제목을 입력하세요">
								</div>
							</div>
							<div class="col-md-3 px-1">
								<div class="form-group">
									<label>Username</label> <input type="text" name="writer"
										class="form-control" value='<sec:authentication property="principal.username"/>' readonly="readonly">
								</div>
							</div>
							<div class="col-md-4 pl-1">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" value="등록일 넣을 거"
										readonly=readoonly>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Contents</label> <input type="text" name="content"
										textarea rows="5" class="form-control" placeholder="내용을 입력하세요"
										style="height: 40vh">
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
									<button id="registerBtn" type="submit" class="btn btn-primary btn-block">Register</button>
								</div>
							</div>
							<div class="col-md-2" style="float: right">
								<div>
									<button class="btn btn-primary btn-block" id="listBtn"
										style="background-color: lightgray">list</button>
								</div>
							</div>
						</div>

					</div>

			</div>
		</div>

	</div>
</div>
</div>



<form id='actionForm'>
	<input type='hidden' name='page' id='page' value=${pageObj.page}>
</form>

<%@include file="../includes/footer.jsp"%>

<script>
	var actionForm = $("#actionForm");
	
	$(document).ready(function(e) {
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; 
		
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
		
		
		$("#listBtn").on("click", function(e) {
			e.preventDefault();
			actionForm.attr("action", "/board/list").attr("method", "get").submit();
		});

		var uploadResult = $(".uploadResult ul");
		
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
		
		$(".uploadResult").on("click", "button", function(e){
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			console.log(targetFile);
			
			$.ajax({
				url: '/deleteFile',
				data: {fileName: targetFile, type:type},
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType: 'text',
				type: 'POST',
					success: function(result){
						alert(result);
						targetLi.remove();
					}
			}); // $.ajax
			
		});
		
		
		var csrfHeaderName = "${_csrf.headerName}";
	    var csrfTokenValue = "${_csrf.token}";
		
		
		$("#uploadBtn").on("click", function(e){
			
			console.log("uploadButton")
			//jQuery를 사용하는 경우 파일 업로드는 FormData라는 객체를 이용하게 된다. 
			//이는 가상의 form태그와 같다고 생각하면 된다. (필요한 파라미터를 담아서 전송하는 방식)
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			console.log(files);
			
			//fileDdata를 formdata
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
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data: formData,
				type: 'POST',
				dataType: 'json',
				success: function(result){
					console.log(result);
					
					showUploadedFile(result);
					
				}
			}); // end ajax
		});
			
		$("#registerBtn").on("click", function(e){
			
			var title = $("input[name='title']").val();
			var writer = $("input[name='writer']").val();
		    var content = $("input[name='content']").val();
			
		    var str = "";
		    $(".uploadResult ul li").each(function(i, obj){
		    	var jobj = $(obj);
		    	console.dir(jobj);
				
		    	str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		    	str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		    	str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		    	str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";

		    });
		    

			    actionForm.append("<input type='hidden' name='title' value='"+title+"'>");
			    actionForm.append("<input type='hidden' name='writer' value='"+writer+"'>");
			    actionForm.append("<input type='hidden' name='content' value='"+content+"'>");
			    actionForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>")
			    actionForm.append(str);
				
				actionForm.attr("action", "/board/register").attr("method", "post").submit();

			});
		
	});
</script>

</body>

</html>