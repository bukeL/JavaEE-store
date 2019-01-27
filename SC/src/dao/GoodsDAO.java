package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import entity.Goods;
import entity.Users;
import util.JDBCbUtil;

public class GoodsDAO {

	public List<Goods> search() {
		QueryRunner qr=new QueryRunner(new JDBCbUtil().getSource());
        String sql="select * from goods";
        List<Goods> goods=null;
        try {
        	goods=qr.query(sql, new BeanListHandler<>(Goods.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return goods;
}

	 public static  Map<String,Object>  getGoodsByPage(int pageNumber,int pageSize) throws Exception {
		  QueryRunner qr=new QueryRunner(new JDBCbUtil().getSource());
		  String sql1="select * from goods";
		  String sql2="select * from goods limit ?,?";
		  //查询一共几条记录
		  int count=qr.query(sql1, new BeanListHandler<Goods>(Goods.class)).size();
	      //查询
		  List<Goods> goods=null;
		  Object[] param={(pageNumber-1)*pageSize,pageSize};
		  goods=qr.query(sql2, param, new BeanListHandler<Goods>(Goods.class));
		  Map<String,Object> maps=new HashMap<String,Object>();
		  //将记录总数和每页记录放到Map集合中
		  maps.put("total", count);
		  maps.put("rows", goods);
		  return maps;
	 }

		public void delete(String id) {
			QueryRunner qr=new QueryRunner(new JDBCbUtil().getSource());
	        //拼写sql语句
	        String sql="delete from  goods where id=?";
	        try {
				qr.update(sql,id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}