package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDAO;
import entity.Users;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  //1-�޸ı��� alt+/
		  request.setCharacterEncoding("UTF-8");
		  response.setCharacterEncoding("UTF-8");
		  //2-��ȡ�û���������
		  String username=request.getParameter("username");
		  String password=request.getParameter("password");
		  Users user=new Users();
		  user.setUsername(username);
		  user.setPassword(password);
		  //3-����UserDAO���� �жϴ��û��Ƿ���� ����-���������� ʧ��-���·��ص�¼
		  UsersDAO ud=new UsersDAO();
		  
		  Users u=ud.login(user);
		  //��ȡ�����
		  //PrintWriter out=response.getWriter();
		  System.out.println(u);
		  if(u!=null) {
			  //��¼�ɹ� ����������  ת�� �ض���
			  //�������Ҫ��ҳ��֮ǰ��������-ת��
			  //��¼ʱ ���û���Ϣ������session��
			  HttpSession session=request.getSession();
			  session.setAttribute("user", user);
			  //out.write("success");
			  request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
			 // response.sendRedirect("/admin/index.jsp");
		  }else {
			  //��¼ʧ�� ��ת����¼ҳ��
			  //out.write("fail");
			  request.setAttribute("msg", "��¼ʧ��");
			  request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
		  }
	}

}
