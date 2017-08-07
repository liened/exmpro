package com.stu.custmgr.exec;

import com.stu.common.persistence.Page;
import com.stu.common.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/custmgr")
public class CustomerController {

    @Autowired
    CustomerService customerService;

    /**
     * 菜单默认跳转页面
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        return "customer/index";
    }

    @RequestMapping("list")
    public String list(HttpServletRequest request, HttpServletResponse response,Customer customer,Model model){
        Page<Customer> initPage = new Page<Customer>(request,response);
        initPage.setPageSize(2);
        Page<Customer> page = customerService.findPage(initPage,customer);
        model.addAttribute("page",page);
        return "customer/list";
    }

    @RequestMapping(value="get")
    @ResponseBody
    public Result get(@RequestParam String id){
        Customer customer = customerService.getById(Integer.parseInt(id));
        if (customer != null){
            return new Result("200","获取客户信息成功",customer);
        }
        return new Result("300","获取用户信息失败");
    }


    @RequestMapping(value = "save",method = RequestMethod.POST)
    @ResponseBody
    public Result save(Customer c){
        int t = customerService.save(c);
        if (t == 1){
            return new Result("200","保存成功");
        }
        return new Result("300","保存失败");
    }

    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Result update(Customer c){
        int t = customerService.update(c);
        if (t == 1){
            return new Result("200","更新成功");
        }
        return new Result("300","更新失败");
    }

    @RequestMapping(value = "delete",method = RequestMethod.POST)
    @ResponseBody
    public Result delete(@RequestParam int id){
        int t = customerService.deleteById(id);
        if (t == 1){
            return new Result("200","删除成功");
        }
        return new Result("300","删除失败");
    }


}
