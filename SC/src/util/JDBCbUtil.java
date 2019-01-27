package util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCbUtil {

	//初始化连接池
	private static  ComboPooledDataSource source=new ComboPooledDataSource("helloc3p0");
	
	//获取一个connection
	public Connection getConn(){
		Connection conn=null;
		   try {
			  conn=source.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return  conn;
	}
	
	//获取一个Combodatasource
	public ComboPooledDataSource getSource(){
		 return source;
	}
	
	
}
