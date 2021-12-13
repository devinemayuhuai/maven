package com.myh.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;

@Controller
public class sendEmail {
    @Autowired
    private JavaMailSender javaMailSender;

    public void sendEmailAtLogin(String username,String email){
        MimeMessage mimeMessage=javaMailSender.createMimeMessage();//创建邮件对象
        MimeMessageHelper messageHelper;
        Properties prop=new Properties();
        String form;
        try {

            prop.load(this.getClass().getResourceAsStream("/mail.properties"));
            form=prop.get("mail.smtp.username")+"";
            System.out.println(form);
            messageHelper=new MimeMessageHelper(mimeMessage,true);
            messageHelper.setFrom(form);
            System.out.println(email);
            messageHelper.setTo(email);
            messageHelper.setSubject("登录通知");
            messageHelper.setText("<p>用户"+username+"您好,欢迎登录玉购商城,祝您购物愉快！</p><br/>"+"<a href=‘http://localhost:8080/ssm_book_war_exploded/’>商城购物</a>",true);
            javaMailSender.send(mimeMessage);
        }catch (MessagingException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }





    }

}
