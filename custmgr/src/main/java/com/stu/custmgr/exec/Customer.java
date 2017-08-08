package com.stu.custmgr.exec;

import com.stu.common.crud.BaseEntity;

/**
 * Created by Administrator on 2017/8/1.
 */
public class Customer extends BaseEntity<Customer>{
    private String custNum;
    private String pwd;
    private String showName;
    private String trueName;
    private String registerTime;

    public String getCustNum() {
        return custNum;
    }

    public void setCustNum(String custNum) {
        this.custNum = custNum;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getShowName() {
        return showName;
    }

    public void setShowName(String showName) {
        this.showName = showName;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + super.getId() +
                ", custNum='" + custNum + '\'' +
                ", pwd='" + pwd + '\'' +
                ", showName='" + showName + '\'' +
                ", trueName='" + trueName + '\'' +
                ", registerTime='" + registerTime + '\'' +
                '}';
    }
}
