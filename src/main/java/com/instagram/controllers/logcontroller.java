package com.instagram.controllers;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.instagram.instagramjdbc;
import com.instagram.newuser;
import com.sun.xml.internal.messaging.saaj.packaging.mime.util.BASE64EncoderStream;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
@Controller
public class logcontroller {

	@Autowired
	instagramjdbc jc;
	@Autowired
	private static Cipher ecipher;
	static SecretKeySpec key;
	static BASE64Encoder encoder = new BASE64Encoder();
	static BASE64Decoder decoder = new BASE64Decoder();
	@ModelAttribute("newuser")
	public newuser createModel() {
	    return new newuser();
	}
	@RequestMapping(value="newuser",method=RequestMethod.POST)
	public ModelAndView adminlog(HttpServletRequest r) throws IOException {
		newuser n= new newuser();
		n.setEmail(r.getParameter("email"));
		n.setName(r.getParameter("name"));
		n.setPassword(r.getParameter("password"));
		n.setUsername(r.getParameter("username"));
		try
		{
			ecipher = Cipher.getInstance("DES");
			byte[] encodedKey = decoder.decodeBuffer("9L9XZx89cJg=");
			key = new SecretKeySpec(encodedKey,0,encodedKey.length, "DES");
		    ecipher.init(Cipher.ENCRYPT_MODE, key);
			String encrypted = encrypt(n.getPassword());
			n.setPassword(encrypted);
		}
		catch (NoSuchAlgorithmException e) {
			System.out.println("No Such Algorithm:" + e.getMessage());
		} catch (NoSuchPaddingException e) {
			System.out.println("No Such Padding:" + e.getMessage());
		} catch (InvalidKeyException e) {
			System.out.println("Invalid Key:" + e.getMessage());
		}
		jc.saveuser(n);
		return new ModelAndView("signin", "loginsuccess", "you arer registered successfully, please sign in");
	}
	@RequestMapping(value="signin",method=RequestMethod.GET)
	public String signin()
	{
		return "signin";
	}
	@RequestMapping(value="newsignin",method=RequestMethod.POST)
	public @ResponseBody String login(@ModelAttribute newuser n,HttpServletRequest r) throws IOException {
		try
		{
			ecipher = Cipher.getInstance("DES");
			byte[] encodedKey = decoder.decodeBuffer("9L9XZx89cJg=");
			key = new SecretKeySpec(encodedKey,0,encodedKey.length, "DES");
		    ecipher.init(Cipher.ENCRYPT_MODE, key);
			String encrypted = encrypt(n.getPassword());
			n.setPassword(encrypted);
		}
		catch (NoSuchAlgorithmException e) {
			System.out.println("No Such Algorithm:" + e.getMessage());
		} catch (NoSuchPaddingException e) {
			System.out.println("No Such Padding:" + e.getMessage());
		} catch (InvalidKeyException e) {
			System.out.println("Invalid Key:" + e.getMessage());
		}
		List <newuser> list=jc.getlogin(n);
		int i=list.size();
		if(i>0) {
		return "authentic user";
		}
		else {
			return "you are not authenticated";
		}
	}
	public static String encrypt(String str) {

		try {
			byte[] utf8 = str.getBytes("UTF8");
			byte[] enc = ecipher.doFinal(utf8);
			enc = BASE64EncoderStream.encode(enc);
			return new String(enc);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
