package jsplec.base;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/response_01S")
public class response_01S extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public response_01S() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String site=request.getParameter("site");
		
		response.setContentType("text/html;charset=utf-8");
		
		response.sendRedirect("http://www."+site+".com");
	}

}
