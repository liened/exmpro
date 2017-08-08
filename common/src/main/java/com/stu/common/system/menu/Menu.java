package com.stu.common.system.menu;

import com.stu.common.crud.BaseEntity;

public class Menu extends BaseEntity<Menu>{

    private String menuCd;
    private String menuName;
    private String url;
    private String parentCd;
    private Integer sort;
    private String icon;
    private String isValue;

    public String getMenuCd() {
        return menuCd;
    }

    public void setMenuCd(String menuCd) {
        this.menuCd = menuCd;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getParentCd() {
        return parentCd;
    }

    public void setParentCd(String parentCd) {
        this.parentCd = parentCd;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getIsValue() {
        return isValue;
    }

    public void setIsValue(String isValue) {
        this.isValue = isValue;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "menuCd='" + menuCd + '\'' +
                ", menuName='" + menuName + '\'' +
                ", url='" + url + '\'' +
                ", parentCd='" + parentCd + '\'' +
                ", sort=" + sort +
                ", icon='" + icon + '\'' +
                ", isValue='" + isValue + '\'' +
                '}';
    }
}
