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

@WebServlet("/publish_holiday")
public class PublishHolidayServlet extends HttpServlet {
    private void publishHoliday(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, IOException, ClassNotFoundException {

        String holidayYear = req.getParameter("holidayYear");
        String holidayname = req.getParameter("holidayname");
        String beginDate = req.getParameter("beginDate");
        String endDate = req.getParameter("endDate");

        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
        String user = "root";
        String password = "123456";
        Connection conn = DriverManager.getConnection(url, user, password);

        String sql = "INSERT INTO holiday (holidayYear, holidayname, beginDate, endDate) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, holidayYear);
        pstmt.setString(2, holidayname);
        pstmt.setString(3, beginDate);
        pstmt.setString(4, endDate);

        pstmt.executeUpdate();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        try {
            publishHoliday(req, resp);
            req.setAttribute("message", "假期发布成功");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            req.setAttribute("message", "假期发布失败");
        }
        req.getRequestDispatcher("publish_holiday.jsp").forward(req, resp);
    }
}
