<%

	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	if(request.getParameter("result").equals("success")) {
		response.sendRedirect("userInsert_04.jsp");
	}else{
		RequestDispatcher rd=request.getRequestDispatcher("userInsert_01.jsp");
		rd.forward(request,response);
	}

%>