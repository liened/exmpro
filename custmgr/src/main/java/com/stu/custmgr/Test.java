package com.stu.custmgr;

import com.stu.common.persistence.Page;
import com.stu.custmgr.exec.Customer;
import com.stu.custmgr.exec.CustomerService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Test {

    public static void main(String[] args) {
        ApplicationContext context =  new ClassPathXmlApplicationContext("spring-context.xml");
        CustomerService cs = (CustomerService) context.getBean("customerService");
//        List<Customer> lst = cs.findList(null);
//        System.out.println("lst:"+lst);
//        for(Customer c:lst){
//            System.out.println(c.toString());
//        }
//        System.out.println("=======================");
//
//        Customer c = new Customer();
//        Page<Customer> page = cs.findPage( new Page<Customer>(2,4),c);
//        System.out.println("page is:");
//        System.out.println(page);
        Customer c1 = cs.getById(1);
        System.out.println("c1:"+c1.toString());
        Customer c2 = cs.getById(1);
        System.out.println("c2:"+c2.toString());
    }
}
