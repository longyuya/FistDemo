package wf.homework;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/add_class")
public class AddClassServlet extends HttpServlet {
    private void add_class(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ClassNotFoundException {
        String name = req.getParameter("name");
        String enreryear = req.getParameter("enreryear");
        String colleagename = req.getParameter("colleagename");

        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
        String user = "root";
        String password="123456";
        Connection conn = DriverManager.getConnection(url, user, password);
        String sql = "insert into t_class(name,enreryear,colleagename) values (?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, name);
        pstmt.setString(2, enreryear);
        pstmt.setString(3, colleagename);
        pstmt.executeUpdate();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            add_class(req, resp);
            req.setAttribute("message", "添加成功");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            req.setAttribute("message", "添加失败");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        try {
            add_class(req, resp);
            req.setAttribute("message", "添加成功");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            req.setAttribute("message", "添加失败");

        }
        req.getRequestDispatcher("add_class.jsp").forward(req, resp);
    }
}

