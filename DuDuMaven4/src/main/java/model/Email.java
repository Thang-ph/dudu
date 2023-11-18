/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;
import javax.activation.DataSource;

/**
 *
 * @author Pham Thang
 */
public class Email {
static final String from = "dudushopcompany@gmail.com";
       static final String password = "vubq fprf khjw zcth";
    // email: phamquangthangad@gmail.com
    //password: cmpt ptgu drxu ebvl
    public static boolean sendEmail(String to,String content, String title){
             Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP host
        props.put("mail.smtp.port", "587"); //TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        //create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
            // phiên làm việc 

        };
        Session session = Session.getInstance(props, auth);
       
        // tạo 1 tin nhắn
        MimeMessage msg = new MimeMessage(session);
        try {
            // kiểu nội dung
            msg.addHeader("Content-type", "text/HTML;charset=UTF-8");
            // người gửi
            msg.setFrom(from);
            // người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            // tiêu đề email
            msg.setSubject(title);
            // quy định ngày gửi
            msg.setSentDate(new Date());
            // quy định email phản hồi về
            //msg.setReplyTo(InternetAddress.parse(from, false));
            // nội dung
            msg.setContent(content, "text/HTML;charset=UTF-8");
            Transport.send(msg);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        }
    public static void main(String[] args) {
  //Properties: khai báo các thuộc tính
  
       Email.sendEmail("phamquangthangadc@gmail.com","thật là đẹp", "cuộc đời vẫn đẹp sao");
    }
}
