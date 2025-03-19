<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
 <form method="post" action="productWriteOk" enctype="multipart/form-data">
  <table width="600" align="center">
    <caption><h3>상품등록</h3></caption>
    <tr>
      <td>상품분류</td>
      <td>
        <select name="pcode">
          <option value="p01">카라반</option>
          <option value="p02">글램핑</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>상품명</td>
      <td><input type="text" name="title"></td>
    </tr>
    <tr>
      <td>가격</td>
      <td><input type="text" name="price"></td>
    </tr>
    <tr>
      <td>기준인원</td>
      <td><input type="text" name="standard"></td>
    </tr>
    <tr>
      <td>최대인원</td>
      <td><input type="text" name="max"></td>
    </tr> 
    <tr>
      <td>적립금</td>
      <td><input type="text" name="save"></td>
    </tr>
    <tr>
      <td>상품이미지</td>
      <td><input type="file" name="expimg"></td>
    </tr>
    <tr>
      <td>상품상세이미지</td>
      <td><input type="file" name="exdimg"></td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" value="상품등록">
      </td>
    </tr> 
  </table>
 </form>
</section>
</body>
</html>