package wf.homework;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/add_student")
public class AddStudentServlet extends HttpServlet {
    private void add_student(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ClassNotFoundException {
        String num = req.getParameter("num");
        String name = req.getParameter("name");
        String gender = req.getParameter("gender");
        String tel = req.getParameter("tel");
        String emerpeople = req.getParameter("emerpeople");
        String emertel = req.getParameter("emertel");
        String classID = req.getParameter("classID");
        String province = req.getParameter("province");
        String city = req.getParameter("city");
        String village = req.getParameter("village");

        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
        String user = "root";
        String password="123456";
        Connection conn = DriverManager.getConnection(url, user, password);
        String sql = "insert into t_student(num,name,gender,tel,emerpeople,emertel,classID,province,city,village) values (?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, num);
        pstmt.setString(2, name);
        pstmt.setString(3, gender);
        pstmt.setString(4, tel);
        pstmt.setString(5, emerpeople);
        pstmt.setString(6, emertel);
        pstmt.setString(7, classID);
        pstmt.setString(8, province);
        pstmt.setString(9, city);
        pstmt.setString(10, village);
        pstmt.executeUpdate();

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            add_student(req, resp);
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
            add_student(req, resp);
            req.setAttribute("message", "添加成功");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            req.setAttribute("message", "添加失败");

        }
        req.getRequestDispatcher("add_student.jsp").forward(req, resp);
    }
}