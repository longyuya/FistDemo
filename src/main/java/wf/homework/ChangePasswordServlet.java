package wf.homework;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/change-password")
public class ChangePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().println("两次输入的密码不一致");
            return;
        }

        String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
        String dbUser = "root";
        String dbPassword = "123456";
        Connection conn = null;
        PreparedStatement pre = null;
        if (oldPassword == null || oldPassword.isEmpty()
                || newPassword == null || newPassword.isEmpty()
                || confirmPassword == null || confirmPassword.isEmpty()) {
            request.setAttribute("message", "密码不能为空");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
            return;
        }
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("message", "两次输入的密码不一致");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPassword);
            String sql = "UPDATE userlogin SET pwd = ? WHERE pwd = ? and username=?";
            pre = conn.prepareStatement(sql);

            pre.setString(1, newPassword);
            pre.setString(2, oldPassword);
            pre.setString(3, username);

            int status = pre.executeUpdate();
            if (status > 0) {
                request.setAttribute("message", "密码修改成功");
            } else {
                request.setAttribute("message", "原密码不正确，更新失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "系统错误：" + e.getMessage());
        } finally {
            if (pre != null) {
                try {
                    pre.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }

        request.getRequestDispatcher("change_password.jsp").forward(request, response);
    }
}
