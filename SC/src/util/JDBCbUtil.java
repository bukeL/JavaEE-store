package util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCbUtil {

	//��ʼ�����ӳ�
	private static  ComboPooledDataSource source=new ComboPooledDataSource("helloc3p0");
	
	//��ȡһ��connection
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
	
	//��ȡһ��Combodatasource
	public ComboPooledDataSource getSource(){
		 return source;
	}
	
	
}
