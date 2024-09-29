package wf.homework;

import java.io.Serializable;

public class User implements Serializable {
    private Integer userId;

    private String userName;

    private String pwd;

    private String identity;

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public Integer getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public String getPwd() {
        return pwd;
    }

    public String getIdentity() {
        return identity;
    }
}

