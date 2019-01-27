package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GoodsDAO;

/**
 * Servlet implementation class GoodsDeleteServlet
 */
@WebServlet("/goodsDelete")
public class GoodsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1-ªÒ»°id
	    String ids=request.getParameter("ids");
	    System.out.println(ids);
	    String[] idArray=ids.split(",");
	    GoodsDAO ud=new GoodsDAO();
	    for (int i = 0; i < idArray.length; i++) {
			  ud.delete(idArray[i]);
		}
	    PrintWriter out=response.getWriter();
	    out.write("success");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
