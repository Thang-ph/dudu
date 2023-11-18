/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.security.MessageDigest;
import org.apache.commons.codec.binary.Base64;




/**
 *
 * @author Pham Thang
 */
public class EncodePasswork {
    public static String toSHA1(String str){
        String sugar="cuz_she_neva_know";
        String result =null;
        str=str+sugar;
        try{
            byte[] dataBytes = str.getBytes("UTF-8");
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            result=Base64.encodeBase64String(md.digest(dataBytes));
        } catch(Exception e){
            System.out.println(e);
        }
        return result;
    }

}
