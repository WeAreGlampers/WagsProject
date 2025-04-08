<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f5f5f5;
        color: #333;
        margin: 0;
        padding: 20px;
    }
    
    table {
        width: 700px;
        margin: 0 auto 20px auto;
        border-collapse: collapse;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        background-color: white;
        border-radius: 8px;
        overflow: hidden;
    }
    
    caption h3 {
        text-align: center;
        margin: 20px 0;
        color: #333;
        font-size: 24px;
    }
    
    td {
        padding: 12px 15px;
        border-bottom: 1px solid #eee;
    }
    
    tr:first-child td {
        border-top: none;
    }
    
    tr:last-child td {
        border-bottom: none;
    }
    
    tr td:first-child {
        width: 100px;
        background-color: #FFF6E0;
        font-weight: bold;
        text-align: center;
    }
    
    input[type="text"], 
    input[type="password"],
    textarea {
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        margin-right: 5px;
        width: 90%;
    }
    
    textarea {
        height: 200px;
        resize: vertical;
    }
    
    input[type="submit"] {
        background-color: #FFF9C4;
        color: #CC723D;
        border: none;
        padding: 8px 16px;
        border-radius: 4px;
        cursor: pointer;
        margin: 10px 3px;
        transition: background-color 0.3s ease;
    }
    
    input[type="submit"]:hover {
        background-color: #FFE08C;
    }
    
    input[type="button"] {
        background-color: #FFF9C4;
        color: #CC723D;
        border: none;
        padding: 8px 16px;
        border-radius: 4px;
        cursor: pointer;
        margin: 10px 3px;
        transition: background-color 0.3s ease;
    }
    
    input[type="button"]:hover {
        background-color: #FFE08C;
    }
    
    .error-msg {
        font-size: 12px;
        color: red;
        padding-left: 10px;
    }
</style>
</head>
<body>
	<form method="post" action="writeOk">
		<table align="center" width="700">
			<input type="hidden" name="userid" value="${userid}">
			<caption> <h3> 글 작성 </h3> </caption>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td> ${userid} </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" id="content"> </textarea></td>
			</tr>

			<tr align="center">
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>


		</table>
	</form>


</body>
</html>