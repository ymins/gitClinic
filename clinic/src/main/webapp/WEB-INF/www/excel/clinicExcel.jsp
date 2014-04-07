<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업로드 예제</title>
<script language="javascript">
	//등록
	function goInsert() {
		var f = document.frm1;
		//var selProgram = $("#selProgram > option:selected").val();
		/*
		if (selProgram == null) {
			alert("프로그램을 선택해주세요.");
			return;
		}
		*/
		if (f.file1.value == "") {
			alert("파일을 선택해주세요.");
			return;
		}
		/*
		var fileNameLen = f.file1.value.length;
		if (f.file1.value.substring(fileNameLen-4, fileNameLen) != 'xlsx') {
			alert("확장자가 xls인 엑셀파일을 선택해 주세요.");
			return;
		}
		*/
		f.submit();
	}
</script>
</head>
<body>
	<form name="frm1" method="post" action="Example2.do" enctype="multipart/form-data">
	<input type="hidden" name="clinicCode" id="clinicCode"/>
		<table border="0">
			<tr><td colspan="2"><b>**주의사항**</b></td></tr>
			<tr><td colspan="2">* 엑셀 파일만 업로드 가능합니다.</td></tr>
			<tr><td colspan="2">* 첫번째 시트에 데이터가 있어야 합니다.(sheet명 : Sheet1)</td></tr>
			<tr><td colspan="2">* 엑셀작성 시 중간에 빈줄이 없어야 합니다.</td></tr>
			<!-- tr>
				<td colspan="4">
					<select name="selProgram" id="selProgram" style="width:70px;">
						<option value="selOne">하나로</option> 
						<option value="selTwo">두번에</option> 
						<option value="selThree">세번에</option> 
					</select>
				<td>
			</tr-->
			<tr>
				<td>파일명</td>
				<td><input type="file" name="file1" size="40"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="javascript:goInsert();">업로드하기</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>