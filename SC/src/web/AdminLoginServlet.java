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
		  //1-修改编码 alt+/
		  request.setCharacterEncoding("UTF-8");
		  response.setCharacterEncoding("UTF-8");
		  //2-获取用户名和密码
		  String username=request.getParameter("username");
		  String password=request.getParameter("password");
		  Users user=new Users();
		  user.setUsername(username);
		  user.setPassword(password);
		  //3-调用UserDAO方法 判断此用户是否存在 存在-跳入主界面 失败-重新返回登录
		  UsersDAO ud=new UsersDAO();
		  
		  Users u=ud.login(user);
		  //获取输出流
		  //PrintWriter out=response.getWriter();
		  System.out.println(u);
		  if(u!=null) {
			  //登录成功 调到主界面  转发 重定向
			  //如果你想要在页面之前传递数据-转发
			  //登录时 将用户信息保存在session中
			  HttpSession session=request.getSession();
			  session.setAttribute("user", user);
			  //out.write("success");
			  request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
			 // response.sendRedirect("/admin/index.jsp");
		  }else {
			  //登录失败 跳转到登录页面
			  //out.write("fail");
			  request.setAttribute("msg", "登录失败");
			  request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
		  }
	}

}
