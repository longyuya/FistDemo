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

@WebServlet("/update_student")
public class UpdateStudentServlet extends HttpServlet {
    private void updateStudent(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, IOException, ClassNotFoundException {

        String num = req.getParameter("num");
        String name = req.getParameter("name");
       String gender =req.getParameter("gender");
        String tel = req.getParameter("tel");
        String emerpeople = req.getParameter("emerpeople");
        String emertel = req.getParameter("emertel");
        String classID = req.getParameter("classID");

        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
        String user = "root";
        String password = "123456";
        Connection conn = DriverManager.getConnection(url, user, password);

        String sql = "UPDATE t_student SET name=?, gender=?, tel=?, emerpeople=?, emertel=?,classID=? WHERE num =?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, gender);
        pstmt.setString(3, tel);
        pstmt.setString(4, emerpeople);
        pstmt.setString(5, emertel);
        pstmt.setString(6, classID);
        pstmt.setString(7, num);

        pstmt.executeUpdate();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            updateStudent(req, resp);
            req.setAttribute("message", "修改成功");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            req.setAttribute("message", "修改失败");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        try {
            updateStudent(req, resp);
            req.setAttribute("message", "修改成功");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            req.setAttribute("message", "修改失败");
        }
        req.getRequestDispatcher("update_student.jsp").forward(req, resp);
    }
}
