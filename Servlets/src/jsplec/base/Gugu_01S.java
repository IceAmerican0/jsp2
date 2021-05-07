package jsplec.base;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Gugu_01S")
public class Gugu_01S extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Gugu_01S() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	PrintWriter writer=response.getWriter();
		int gugu=Integer.parseInt(request.getParameter("gugu"));
		String result="";
		response.setContentType("text/html;charset=utf-8");
		
		
		for(int i=1;i<10;i++) writer.println(gugu+" X "+i+" = "+(gugu*i)+"<br>");
		
		
//		for(int i=1;i<10;i++) result+=gugu+" X "+i+" = "+(gugu*i)+"<br>";
		
//		request.setAttribute("result", result);
//		
//		RequestDispatcher rd=request.getRequestDispatcher("Gugu_01.jsp");
//		rd.forward(request, response);
		
	}

	

}
