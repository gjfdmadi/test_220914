<%@page import="java.io.File"%>
<%@page import="semiProject.uploadProduct.ProductBean"%>
<%@page import="semiProject.uploadProduct.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");

	int product_number = Integer.parseInt(request.getParameter("product_number"));
	System.out.println("num===============>"+product_number);
	ProductDBBean updb = ProductDBBean.getInstance();
	ProductBean upbd = updb.getImg(product_number);
	
	String fname = upbd.getStored_file_name();
	System.out.println(fname);
	
	String path = request.getSession().getServletContext().getRealPath("\\img");
	
	//String file_folder = "C:\\jsp_project\\semiProject\\WebContent\\img";
	System.out.println("path======>"+path);
	
	int re = updb.deleteProduct(product_number);
	System.out.print("re ======= >"+re);
	
	if(re == 1) {
		if(fname != null) {//업로드 파일 삭제
			File file = new File(path+"\\"+fname);  //생성자 매개변수: 폴더경로+파일이름
			file.delete();//파일 삭제하는 코드
		}
	%>
		<script type="text/javascript">
			alert("삭제됐습니다.");
		</script>
	<%		
		response.sendRedirect("productList.jsp?pageNum="+"pageNum");
	}
%>