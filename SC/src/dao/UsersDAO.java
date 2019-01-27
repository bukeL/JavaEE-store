package dao;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import entity.Users;
import util.JDBCbUtil;

public class UsersDAO {


// 登录验证
	public Users login(Users user) {
        QueryRunner qr=new QueryRunner(new JDBCbUtil().getSource());
        //拼写sql语句
        String sql="select * from users where username=? and password=? limit 1";
        //写参数
        Object[] param={user.getUsername(),user.getPassword()};
        //执行sql语句返回结果  增删改 upadte 查询 query
        Users u=null;
        try {
			u=qr.query(sql, param, new BeanHandler<>(Users.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}





}
