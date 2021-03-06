<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.util.*, com.picture.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	File file;

	//파일 업로드 제한 용량(byte단위)
	//1024byte -> 1K byte
	//1024K byte -> 1M byte
	//1024M byte -> 1G byte
	int maxFileSize = 5 * 1024 * 1024; //5M byte
	int maxMemSize = 5 * 1024 * 1024;
	/* 
	ServletContext context = pageContext.getServletContext();
	String filePath = context.getInitParameter("file-upload");
	*/
	String filePath = request.getServletContext().getRealPath("resources//picture");

	// Verify the content type
	String contentType = request.getContentType();

	if ((contentType.indexOf("multipart/form-data") >= 0)) {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);

		// Location to save data that is larger than maxMemSize.
		factory.setRepository(new File("c:\\temp"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// maximum file size to be uploaded.
		upload.setSizeMax(maxFileSize);

		try {
			// Parse the request to get file items.
			List<FileItem> fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator<FileItem> i = fileItems.iterator();

			String newFileName = "";
			String content = "";

			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();

				if (fi.isFormField()) {
					content = fi.getString("UTF-8");
					System.out.println("content:" + content);
				} else {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();

					String fileName = fi.getName();
					System.out.println("original FileName:" + fileName + "<br>");

					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();

					String type = fi.getContentType();
					System.out.println("ContentType:" + type);

					// Write the file
					/* 
					if (fileName.lastIndexOf("\\") >= 0) {
						file = new File(filePath + "\\" + fileName.substring(fileName.lastIndexOf("\\")));
					} else {
						file = new File(filePath + "\\" + fileName.substring(fileName.lastIndexOf("\\") + 1));
					}
					 */
					String ext = fileName.substring(fileName.lastIndexOf("."));
					newFileName = Util.randomFileName() + ext;

					file = new File(filePath + "\\" + newFileName);
					System.out.println("new FilePath + FileName:" + (filePath + "\\" + newFileName));

					//주의) 서버의 특정 저장소에 물리적 파일이 저장된다.
					//주의) 물리적 파일이름이 같은 파일인 경우 덮어쓰기가 된다. 
					//-> 유니크 파일 이름 생성 
					//-> 확장자는 그대로 유지해야 한다. 
					//-> "동적생성된파일이름.확장자"
					fi.write(file);

				}

			}

			//데이터베이스에 사진 파일 정보 저장 액션 진행
			//->사진파일이름(original, new), 사진파일사이즈(byte 단위), 사진설명, 등록일

			int result = 0;
			String txt = "";
			if (newFileName != null) {
				PictureDAO dao = new PictureDAO();
				try {
					result = dao.pictureADD(new Picture(null, newFileName, content));
					if (result == 1) {
						txt = "success";
					} else {
						throw new Exception("데이터베이스 오류 발생!");
					}
				} catch (Exception e) {
					e.printStackTrace();
					txt = "fail";
				}
			}


		} catch (Exception ex) {
			System.out.println(ex);
		}
	}

	response.sendRedirect("sample046.jsp?result=success");
%>