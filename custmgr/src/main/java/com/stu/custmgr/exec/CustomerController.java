package com.stu.custmgr.exec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/custmgr")
public class CustomerController {

    @Autowired
    CustomerService customerService;

    @RequestMapping(value = "toAdd",method = RequestMethod.GET)
    public String toAdd(){
        return "customer/add";
    }

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(Customer c){
        customerService.save(c);
        return "customer/success";
    }

    @RequestMapping(value = "toUpdate/{id}",method = RequestMethod.GET)
    public String toUpdate(Model model, @PathVariable("id") int id){
        Customer c = customerService.getById(id);
        model.addAttribute("customer",c);
        return "customer/success";
    }

    @RequestMapping(value = "update",method = RequestMethod.POST)
    public String update(Customer c){
        customerService.update(c);
        return "customer/success";
    }

    @RequestMapping(value = "delete",method = RequestMethod.POST)
    public String delete(@RequestParam int id){
        customerService.deleteById(id);
        return "customer/success";
    }

}
