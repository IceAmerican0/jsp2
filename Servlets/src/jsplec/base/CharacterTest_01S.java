package jsplec.base;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CharacterTest_01S")
public class CharacterTest_01S extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CharacterTest_01S() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
    	PrintWriter writer=response.getWriter();
		
    	String name=request.getParameter("name");
    	String color=request.getParameter("color");
    	String animal=request.getParameter("animal");
    	String[] food=request.getParameterValues("food");
    	
    	String result="";
    	
    	if(food.length>1) {
    		int i=0;
    		for(;i<food.length-1;i++) result+=food[i]+" 과 ";
    		result+=food[i];
    	}

    	writer.print(name+"님의 테스트 결과 <br>"+color+"색을 좋아하는 당신은 "+animal+" 그리고 "+result+"을 좋아하는 성격입니다.");
    	writer.print("<br><hr><br>저장 되었습니다!");
		
		
		
	}

}
