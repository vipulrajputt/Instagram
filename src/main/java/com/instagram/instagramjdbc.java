package com.instagram;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.instagram.newuser;

public class instagramjdbc {

	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  
	public int saveuser(newuser n){  
	    String sql="insert into newuser(name,username,email,password)values('"+n.getName()+"','"+n.getUsername()+"','"+n.getEmail()+"','"+n.getPassword()+"')";  
	    return template.update(sql);  
	}
	public List<newuser> getlogin(newuser p){  
		return template.query("select * from newuser where username='"+p.getUsername()+"'and password='"+p.getPassword()+"'",new RowMapper<newuser>(){  
		        public newuser mapRow(ResultSet rs, int row) throws SQLException {  
		        	newuser e=new newuser();
		        	e.setName(rs.getString(2));
		        	e.setEmail(rs.getString(4));    
		            return e;  
		        }  
		    });  
	}
	
	
}
