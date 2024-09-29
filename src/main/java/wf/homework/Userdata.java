package wf.homework;

public class Userdata {
    private int id;
    private String account;
    private String name;
    private String pwd;

    private String num;
    private String gender;
    private String tel;
    private String emerpeople;
    private String emertel;
    private  String province;
    private  String city;
    private  String village;

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    private String cname;

private int classID;

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID= classID;
    }

    public Userdata(int id, String account, String name, String pwd, String num, String gender, String tel, String emerpeople, String emertel, String province, String city, String village, String cname) {
        this.id = id;
        this.account = account;
        this.name = name;
        this.pwd = pwd;
        this.num = num;
        this.gender = gender;
        this.tel = tel;
        this.emerpeople = emerpeople;
        this.emertel = emertel;
        this.province = province;
        this.city = city;
        this.village = village;
        this.cname = cname;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmerpeople() {
        return emerpeople;
    }

    public void setEmerpeople(String emerpeople) {
        this.emerpeople = emerpeople;
    }

    public String getEmertel() {
        return emertel;
    }

    public void setEmertel(String emertel) {
        this.emertel = emertel;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String detailAddress) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public String getVillage() {
        return village;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setVillage(String village) {
        this.village = village;
    }

    public Userdata() {
    }

    public Userdata(String account,String pwd,int id,  String name) {
        this.id = id;
        this.account = account;
        this.name = name;
        this.pwd = pwd;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }


}
