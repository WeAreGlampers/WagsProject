<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.filebox .upload-name {
    display: inline-block;
    height: 20px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid black;
    width: 30%;
    color: black;
}
.filebox label {
    display: inline-block;
    line-height:20px;
    cursor: pointer;
    height: 20px;
    margin-left: 10px;
    font-size:12px;
    vertical-align: middle;
    border:1px solid black;
    padding-left:10px;
    padding-right:10px;
}
.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
</style>
<script>
function upload(index){
	if(index==0){
		document.getElementsByClassName("upload-name")[index].value=document.getElementById("file1").value;
	}
	else{
		document.getElementsByClassName("upload-name")[index].value=document.getElementById("file2").value;
	}
}
</script>
</head>
<body>
<section>
 <form name="pform" method="post" action="productUpdateOk" enctype="multipart/form-data">
  <input type="hidden" name="id" value="${pdto.id}">
  <table width="600" align="center">
    <caption><h3>상품수정</h3></caption>
    <tr>
      <td>상품명</td>
      <td><input type="text" name="title" value="${pdto.title}"></td>
    </tr>
    <tr>
      <td>가격</td>
      <td><input type="text" name="price" value="${pdto.price}"></td>
    </tr>
    <tr>
      <td>기준인원</td>
      <td><input type="text" name="standard" value="${pdto.standard}"></td>
    </tr>
    <tr>
      <td>최대인원</td>
      <td><input type="text" name="max" value="${pdto.max}"></td>
    </tr> 
    <tr>
      <td>적립금</td>
      <td><input type="text" name="save" value="${pdto.save}"></td>
    </tr>
    <tr>
      <td>상품이미지</td>
      <td>
        <div class="filebox">
    		<input class="upload-name" name="pimg" value="${pdto.pimg}" placeholder="첨부파일">
   			<label for="file1">파일변경</label> 
    		<input type="file" id="file1" name="expimg" onchange="upload(0)">
		</div>
      </td>
    </tr>
    <tr>
      <td>상품상세이미지</td>
      <td>
        <div class="filebox">
    		<input class="upload-name" name="dimg" value="${pdto.dimg}" placeholder="첨부파일">
   			<label for="file2">파일변경</label> 
    		<input type="file" id="file2" name="exdimg" onchange="upload(1)">
		</div>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" value="상품수정">
      </td>
    </tr> 
  </table>
 </form>
</section>
</body>
</html>