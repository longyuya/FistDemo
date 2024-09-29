package wf.homework;

import java.util.Date;

public class holidayServlet {
    private Date holidayYear;
    private String holidayname;
    private Date beginDate;
    private Date endDate;

    public holidayServlet(Date holidayYear, String holidayname, Date beginDate, Date endDate) {
        this.holidayYear = holidayYear;
        this.holidayname = holidayname;
        this.beginDate = beginDate;
        this.endDate = endDate;
    }

    public Date getHolidayYear() {
        return holidayYear;
    }

    public String getHolidayname() {
        return holidayname;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setHolidayYear(Date holidayYear) {
        this.holidayYear = holidayYear;
    }

    public void setHolidayname(String holidayname) {
        this.holidayname = holidayname;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public holidayServlet() {
    }
}
