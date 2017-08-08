package com.stu.common.system.menu;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.stu.common.crud.BaseEntity;

import java.util.List;

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


    @JsonIgnore
    public static void sortList(List<Menu> list, List<Menu> sourcelist, String parentCd, boolean cascade){
        for (int i=0; i<sourcelist.size(); i++){
            Menu e = sourcelist.get(i);
            if (e.getParentCd()!=null && e.getParentCd().equals(parentCd)){
                list.add(e);
                if (cascade){
                    // 判断是否还有子节点, 有则继续获取子节点
                    for (int j=0; j<sourcelist.size(); j++){
                        Menu child = sourcelist.get(j);
                        if (child.getParentCd()!=null && child.getParentCd().equals(e.getMenuCd())){
                            sortList(list, sourcelist, e.getMenuCd(), true);
                            break;
                        }
                    }
                }
            }
        }
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
