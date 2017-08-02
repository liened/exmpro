package com.stu.custmgr.exec;

import com.stu.common.crud.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class CustomerService extends BaseService<CustomerDao,Customer>{

}
