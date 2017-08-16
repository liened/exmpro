package com.stu.common.utils.system;

import com.stu.common.system.menu.Menu;
import com.stu.common.system.menu.MenuDao;
import com.stu.common.utils.SpringContextHolder;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

public class UserUtils {

    private static MenuDao menuDao = SpringContextHolder.getBean(MenuDao.class);

    private static final String CACHE_MENU_LIST = "menuList";


    public static List<Menu> getMenuList(){
        return menuDao.findList(null);
    }

    public static String getMemuListStr(){
        List<Menu> menuList = menuDao.findList(null);
        return sortList(menuList,"0");
    }

    public static String sortList(List<Menu> sourcelist, String parentCd) {
        StringBuffer sb = new StringBuffer();
        for(int i = 0; i < sourcelist.size(); ++i) {
            Menu e = sourcelist.get(i);
            if(e.getParentCd().equals(parentCd)) {
                boolean childFlag = false;
                if (StringUtils.isBlank(e.getUrl())){
                    childFlag = true;
                }
                sb.append("<li class=\"" + (childFlag?"treeview":"") + "\">").append("\n");
                sb.append("    <a href=\"#\" ").append(childFlag?"":"data-action=\"" + SpringContextHolder.getApplicationContext().getApplicationName() + e.getUrl() + "\" ").append("\">").append("\n");
                sb.append("        <i class=\"" + (childFlag?e.getIcon():"fa fa-circle-o") + "\"></i> <span>" + e.getMenuName() + "</span> " + (childFlag?"<i class=\"fa fa-angle-left pull-right\"></i>":"")).append("\n");
                sb.append("    </a>").append("\n");
                boolean flag = false;

                for(int j = 0; j < sourcelist.size(); ++j) {
                    Menu child = sourcelist.get(j);
                    if(child.getParentCd() != null && child.getParentCd().equals(e.getMenuCd())) {
                        if(!flag) {
                            sb.append("<ul class=\"treeview-menu\">").append("\n");
                            flag = true;
                        }
                        sb.append(sortList(sourcelist, e.getMenuCd()));
                        break;
                    }
                }

                if(flag) {
                    sb.append("</ul>").append("\n");
                }

                sb.append("</li>").append("\n");
            }
        }

        return sb.toString();
    }
}
