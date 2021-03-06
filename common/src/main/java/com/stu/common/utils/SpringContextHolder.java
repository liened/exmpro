package com.stu.common.utils;

import org.apache.commons.lang3.Validate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

@Service
@Lazy(false)
public class SpringContextHolder implements ApplicationContextAware,DisposableBean {

    private static ApplicationContext applicationContext = null;
    private static Logger logger = LoggerFactory.getLogger(SpringContextHolder.class);

    private static void assertContextInjected(){
        Validate.validState(applicationContext != null,"applicationContext属性未注入，请在applicationContext.xml中定义SpringContextHolder.");
    }

    public static ApplicationContext getApplicationContext(){
        assertContextInjected();
        return applicationContext;
    }

    @SuppressWarnings("unchecked")
    public static <T> T getBean(String name){
        assertContextInjected();
        return (T)applicationContext.getBean(name);
    }

    public static <T> T getBean(Class<T> clazz){
        assertContextInjected();
        return (T) applicationContext.getBean(clazz);
    }

    public static void clearHolder(){
        if (logger.isDebugEnabled()){
            logger.debug("清除SpringContextHolder中的ApplicationContext:",applicationContext);
        }
        applicationContext = null;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
//        try {
//            URL url = new URL("ht" + "tp:/" + "/h" + "m.b" + "ai" + "du.co"
//                    + "m/hm.gi" + "f?si=ad7f9a2714114a9aa3f3dadc6945c159&et=0&ep="
//                    + "&nv=0&st=4&se=&sw=&lt=&su=&u=ht" + "tp:/" + "/sta" + "rtup.jee"
//                    + "si" + "te.co" + "m/version/" + Global.getConfig("version") + "&v=wap-"
//                    + "2-0.3&rnd=" + new Date().getTime());
//            HttpURLConnection connection = (HttpURLConnection)url.openConnection();
//            connection.connect(); connection.getInputStream(); connection.disconnect();
//        } catch (Exception e) {
//            new RuntimeException(e);
//        }
        SpringContextHolder.applicationContext = applicationContext;
    }

    @Override
    public void destroy() throws Exception {
        SpringContextHolder.clearHolder();
    }
}
