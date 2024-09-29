package com.servlet;

import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//@WebServlet(urlPatterns="/student")
public class StudentServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)  {
        String action = req.getParameter("action");
        if("query".equals(action)) {
            try {
                queryStudent(req,resp);
            } catch (ClassNotFoundException | SQLException | ServletException | IOException e) {
                e.printStackTrace();
            }
        }else if("delete".equals(action)) {
            try {
                deleteStudentByID(req,resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
      /*  else if("add".equals(action))
        {
            try {
                add_student(req,resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }*/
    }
/*

    private void add_student(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ClassNotFoundException {
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        int year = Integer.parseInt(req.getParameter("year"));
        String fudaoyuan = req.getParameter("fudaoyuan");
        String depart = req.getParameter("depart");
        String numid = req.getParameter("numid");
        String create_time = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());

        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/school?serverTimezone=UTC";
        String user = "root";
        String password="123456";
        Connection conn = DriverManager.getConnection(url, user, password);
        String sql = "insert into classcom(name,age,year,fudaoyuan,depart,numid,create_time) values ('"+name+"','"+age+"','"+year+"','"+fudaoyuan+"','"+depart+"','"+numid+"','"+create_time+"')";
        Statement st = conn.createStatement();
        st.execute(sql);
        resp.sendRedirect(req.getContextPath()+"/student?action=query");
    }
*/

    private void deleteStudentByID(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");
        if(id == null || "".equals(id.trim())) {
            throw new Exception("参数不正确");
        }
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/school?serverTimezone=UTC";
        String user = "root";
        String password="2284";
        Connection conn = DriverManager.getConnection(url, user, password);
        String sql = "delete from classcom where id= "+id;
        Statement st = conn.createStatement();
        st.execute(sql);
        resp.sendRedirect(req.getContextPath()+"/student?action=query");
    }

    private void queryStudent(HttpServletRequest req, HttpServletResponse resp)
            throws ClassNotFoundException, SQLException, ServletException, IOException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/school?serverTimezone=UTC";
        String user = "root";
        String password="2284";
        Connection conn = DriverManager.getConnection(url, user, password);
        // String sql = "insert into student(num,name,birthday) values('10090','张三','1999-09-08')";
        String sql = "select * from classcom";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
//        System.out.println(rs);
        List<Student> datas = new ArrayList<>();
        while(rs.next()){
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int age = rs.getInt("age");
            int year = rs.getInt("year");
            String fudaoyuan = rs.getString("fudaoyuan");
            String depart = rs.getString("depart");
            String numid = rs.getString("numid");
            String create_time = rs.getString("create_time");
            String update_time = rs.getString("update_time");
            Student student = new Student(id,name,age,year,fudaoyuan,depart,numid,create_time,update_time);
            datas.add(student);


        }
        rs.close();
        st.close();
        conn.close();
        req.setAttribute("students", datas);
        req.getRequestDispatcher("main.jsp").forward(req, resp);
    }


}