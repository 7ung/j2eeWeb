/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import java.awt.Image;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.IOUtils;

/**
 *
 * @author quytocngheo
 */
//@Controller
//@Service
public class ImageController {
    
//    @Autowired
//    private ServletContext servletContext;
//    
//    @RequestMapping(value = "/resources/image/{imageName}")
//    @ResponseBody
//    public String helloWorld(@PathVariable String imageName)  {
//      //Image image = new ImageIcon(this.getClass().getResource("/images/bell-icon16.png")).getImage();
//      System.out.print("ababababab"+ imageName);
//      return getImageByName(imageName);
//    }
//    
//    public String getImageByName(String name){
//        File f =  new File(servletContext.getContextPath()+"/src/main/webapp/resources/image/"+name+".png");
//        //Image image = new ImageIcon(this.getClass().getResource("/images/bell-icon16.png")).getImage();
//        String encodstring = encodeFileToBase64Binary(f);
//        System.out.print("endcode"+encodstring);
//        return encodstring;
//    }
//    
//    private static String encodeFileToBase64Binary(File file){
//            String encodedfile = null;
//            try {
//                FileInputStream fileInputStreamReader = new FileInputStream(file);
//                System.out.printf("endcode length %d",file.length());
//                byte[] bytes = new byte[(int)file.length()];
//                fileInputStreamReader.read(bytes);
//                encodedfile = new String(Base64.encodeBase64(bytes), "UTF-8");
//            } catch (FileNotFoundException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            } catch (IOException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//
//            return encodedfile;
//        }
}
