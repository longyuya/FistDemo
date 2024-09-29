package wf.homework;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class Methods {
    static Connection conn = null;

    public void check_login(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
        String user = "root";
        String password = "123456";
        this.conn = DriverManager.getConnection(url, user, password);
    }

    public void showConnect() {
        if (conn == null) {
            System.out.println("数据库连接成功");
        } else {
            System.out.println("数据库连接失败");
        }

    }

    public void close() throws SQLException {
        conn.close();
    }

    public static Userdata getUser(String account) throws SQLException {
        PreparedStatement prep = conn.prepareStatement("select *from userlogin where username=?");
        prep.setString(1, account);
        prep.execute();
        ResultSet resultSet = prep.executeQuery();
        if (resultSet.next()) {
            int myid = resultSet.getInt("id");
            String myaccount = resultSet.getString("account");
            String mypwd = resultSet.getString("pwd");
            String myname = resultSet.getString("name");
            return new Userdata(myaccount, mypwd, myid, myname);
        }
        return null;


    }
}
