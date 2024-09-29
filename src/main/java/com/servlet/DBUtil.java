package com.servlet;

import java.sql.*;

public class DBUtil {
    private static final String url ="jdbc:mysql://localhost:3306/";
    private static final String user="root";
    private static final String password="2284";
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
    }


}
