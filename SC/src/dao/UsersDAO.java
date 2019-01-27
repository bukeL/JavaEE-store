package dao;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import entity.Users;
import util.JDBCbUtil;

public class UsersDAO {


// ��¼��֤
	public Users login(Users user) {
        QueryRunner qr=new QueryRunner(new JDBCbUtil().getSource());
        //ƴдsql���
        String sql="select * from users where username=? and password=? limit 1";
        //д����
        Object[] param={user.getUsername(),user.getPassword()};
        //ִ��sql��䷵�ؽ��  ��ɾ�� upadte ��ѯ query
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
