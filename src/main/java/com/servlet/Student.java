package com.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.Date;

public class Student extends HttpServlet {
    private int id;
    private String name;
    private int age;
    private int year;
    private String fudaoyuan;
    private String depart;
    private String numid;
    private String create_time;
    private String update_time;


    public Student() {

    }

    public Student(int id, String name, int age, int year,String fudaoyuan,String depart,String numid,String create_time,String update_time) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.year = year;
        this.fudaoyuan = fudaoyuan;
        this.depart = depart;
        this.numid = numid;
        this.create_time = create_time;
        this.update_time = update_time;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
    }
    public String getFudaoyuan() {
        return fudaoyuan;
    }
    public void setFudaoyuan(String fudaoyuan) {
        this.fudaoyuan = fudaoyuan;
    }
    public String getDepart() {
        return depart;
    }
    public void setDepart(String depart) {
        this.depart = depart;
    }
    public String getNumid() {
        return numid;
    }
    public void setNumid(String numid) {
        this.numid = numid;
    }
    public String getCreate_time(){
        return create_time;
    }
    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }
    public String getUpdate_time(){
        return update_time;
    }
    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }


}