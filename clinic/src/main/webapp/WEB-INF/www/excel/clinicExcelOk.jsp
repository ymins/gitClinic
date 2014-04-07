<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="jxl.*" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>

<%
	String clinic_code, clinicNm, clinicArea, clinicTel, clinicFax;
	String mngNm, mngTel, mngEmail, clinicGr;
	String doctorNm, doctorSch, doctorNum, doctorTel, doctorEmail;
	String taxNm, taxTel, insurancePro, readerSite, readerTel, licenseNb, intrId, intrPw;
	String clinicAddr, zipCode, clinicEtc;
	
	/*빠진 컬럼들 clnic_gr, clinic_Seq*/
	
	/* 파일을 저장 할 서버의 경로를 지정 */
	String savePath = request.getSession().getServletContext().getRealPath("/") +"uploaddata";

	/* 파일이 첨부된 request에 사용될 변수를 선언 */
	int sizeLimit = 30 * 1024 * 1024;
	String formName = "";
	String fileName = "";
	long fileSize = 0;
	
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
	Enumeration formNames = multi.getFileNames();
	
	//String clinicCode = multi.getParameter("clinicCode");
	while (formNames.hasMoreElements()) {
		formName= (String)formNames.nextElement();
		fileName = multi.getFilesystemName(formName);
		
		if (fileName != null) {
			fileSize = multi.getFile(formName).length();
		}
	}
	
	/* 서버에 업로드한 엑셀파일의 시트1 객체를 가져옵니다. */
	Workbook workbook = Workbook.getWorkbook(new File(savePath + "/" + fileName));
	Sheet sheet = workbook.getSheet(0);
	
	/* mysql에 연결합니다. */
	Connection con = null;
	PreparedStatement pstmt = null;
	String query = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	con = DriverManager.getConnection("jdbc:mysql://asklab.co.kr:3306/asklab","asklab","askrhksflwk1");
	/* 트랜잭션을 겁니다. */
	con.setAutoCommit(false);

	Logger logger = LoggerFactory.getLogger(getClass());
	logger.info("Welcome main! The client locale is {}.", sheet.getRows());
	
	for(int rowIndex = 1; rowIndex < sheet.getRows(); rowIndex++) {
		clinic_code 	= sheet.getCell(0, rowIndex).getContents(); 
		clinicNm 			= sheet.getCell(1, rowIndex).getContents(); 
		clinicArea 		= sheet.getCell(2, rowIndex).getContents();  
		clinicTel 		= sheet.getCell(3, rowIndex).getContents();  
		clinicFax 		= sheet.getCell(4, rowIndex).getContents(); 
		mngNm 				= sheet.getCell(5, rowIndex).getContents(); 
		doctorNm 			= sheet.getCell(6, rowIndex).getContents();  
		taxNm 				= sheet.getCell(7, rowIndex).getContents();  
		taxTel 				= sheet.getCell(8, rowIndex).getContents();  
		insurancePro 	= sheet.getCell(9, rowIndex).getContents();  
		readerSite 		= sheet.getCell(10, rowIndex).getContents();  
		readerTel 		= sheet.getCell(11, rowIndex).getContents();  
		clinicAddr 		= sheet.getCell(12, rowIndex).getContents();
		zipCode 			= sheet.getCell(13, rowIndex).getContents();
		clinicEtc			= sheet.getCell(14, rowIndex).getContents(); 
		clinicGr			= sheet.getCell(15, rowIndex).getContents(); 
		
		/*유효성 검사 */
		if (clinicNm == "") {
%>
<script language="javascript">
	alert("[<%=rowIndex+1%>]+행의 병원명이 없습니다.");
</script>
<%
	con.rollback();
	workbook.close();
%>
<script language="javascript">
	window.close();
</script>
<%
		}
		
		query = "INSERT INTO `asklab`.`CLINIC_INFO` (CLINIC_CODE, CLINIC_NM, CLINIC_AREA, CLINIC_TEL, CLINIC_FAX, MNG_NM, DOCTOR_NM, TAX_NM, TAX_TEL, INSURANCE_PRO, READER_SITE, READER_TEL, CLINIC_ADDR, ZIP_CODE, CLINIC_ETC, CLINIC_GR) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		pstmt = con.prepareStatement(query);
		
		pstmt.setString(1, clinic_code);
		pstmt.setString(2, clinicNm); 
		pstmt.setString(3, clinicArea);  
		pstmt.setString(4, clinicTel);  
		pstmt.setString(5, clinicFax); 

		pstmt.setString(6, mngNm); 
		pstmt.setString(7, doctorNm);  
		pstmt.setString(8, taxNm);

		pstmt.setString(9, taxTel);  
		pstmt.setString(10, insurancePro);  
		pstmt.setString(11, readerSite);  
		pstmt.setString(12, readerTel);  
		pstmt.setString(13, clinicAddr);

		pstmt.setString(14, zipCode);  
		pstmt.setString(15, clinicEtc);  
		pstmt.setString(16, clinicGr);  
		
		int cnt = pstmt.executeUpdate();
		
		pstmt.close();
	}
	
	con.commit();
	workbook.close();
	/*작업이 끝나면 서버에 업로드한 엑셀파일 삭제*/
	File file = new File(savePath + "/" + fileName );
	file.delete();
	
	if (con != null) con.close();
%>
<script language="javascript">
	alert("등록이 완료되었습니다.");
	window.close();
</script>
