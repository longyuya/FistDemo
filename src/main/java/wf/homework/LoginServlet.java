package wf.homework;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(urlPatterns="/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if ("Login".equals(action)) {
            doPost(req, resp);
        }
    }
    protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws
            ServletException, IOException {
        try {
            String username = req.getParameter("username");
            String pwd = req.getParameter("pwd");
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
            String user = "root";
            String password = "123456";
            Connection conn = DriverManager.getConnection(url, user, password);
            String query = "SELECT * FROM userlogin WHERE username = ? AND pwd = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, pwd);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String name1 = rs.getString("username");
                String password1 = rs.getString("pwd");
                String identity = rs.getString("identity");
                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                if (username.equals(name1) && password1.equals(pwd) && identity.equals("学生")) {

                    req.getRequestDispatcher("student.jsp").forward(req, resp);
                } else if (username.equals(name1) && password1.equals(pwd) && identity.equals("管理员")) {
                    req.getRequestDispatcher("manger.jsp").forward(req, resp);
                }
            }
            rs.close();
        } catch (SQLException | IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}