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
import java.sql.Statement;

@WebServlet("/dest_registration")
public class DestinationRegistrationServlet extends HttpServlet {

    private void registerDestination(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, IOException, ClassNotFoundException {
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
        String vehicle = req.getParameter("vehicle");
        String lixiao = req.getParameter("lixiao");


        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
        String user = "root";
        String password="123456";
        Connection conn = DriverManager.getConnection(url, user, password);
        String sql = "insert into t_student(num,name,gender,tel,emerpeople,emertel,classID,province,city,village,vehicle,lixiao) values (?,?,?,?,?,?,?,?,?,?,?,?)";
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
        pstmt.setString(11, vehicle);
        pstmt.setString(12, lixiao);
        pstmt.executeUpdate();

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        try {
//

            registerDestination(request, response);
            request.setAttribute("message", "假期去向登记成功");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("message", "假期去向登记失败");
        }catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "假期去向登记失败: " + e.getMessage());
        }

        request.getRequestDispatcher("DestinationRegistrationServlet.jsp").forward(request, response);
    }




}
