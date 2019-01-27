package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GoodsDAO;
import entity.Goods;
import entity.Users;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class GoodsSearchServlet
 */
@WebServlet("/goodsSearch")
public class GoodsSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		 //1-编码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
      //2-调用UserDAO方法 返回所有用户的列表List 返回给界面
        String pageNumber=request.getParameter("offset");
        String pageSize=request.getParameter("limit");
        GoodsDAO ud=new GoodsDAO();
        Map maps=new HashMap<>();
        List<Goods> goods=null;
        try {
			maps=ud.getGoodsByPage(Integer.parseInt(pageNumber), Integer.parseInt(pageSize));
		    int total=(int) maps.get("total");
		    goods=(List<Goods>) maps.get("rows");
		    //页面和servlet之间进行数据的传递-json
		    JSONArray goodsja=JSONArray.fromObject(goods);
		    String json = "{\"total\":" + total + ",\"rows\":" + goodsja + "}";
		    PrintWriter out=response.getWriter();
		    out.write(json);
        } catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
