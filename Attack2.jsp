
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Attacker</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24px}
.style2 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
	<div class="logo style1">
        <h3 class="style1 style2">Identity Based Privacy Preserving Remote Data Integrity <br />
Checking With a Designated Verifier </h3>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>Home </span></a></li>
          
          <li></li>
        </ul>
      </div>
   
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Content Attacker </h2>
          <p>&nbsp;</p>
          <div>
            <p>&nbsp;</p>
            <%
String aname=request.getParameter("aname");
String file=request.getParameter("fname");
String block=request.getParameter("block");

String owner=request.getParameter("owner");
String cont=request.getParameter("cont");
String strQuery2="";

try
{
String keys = "ef50a0ef2c3e3a5f";
			String query2="";
			
	
			String h1 = "";
			String filename = "filename.txt";


			byte[] keyValue = keys.getBytes();
			Key key = new SecretKeySpec(keyValue, "AES");
			Cipher c = Cipher.getInstance("AES");
			c.init(Cipher.ENCRYPT_MODE, key);
			String encryptedValue = new String(Base64.encode(cont.getBytes()));
			PrintStream p = new PrintStream(new FileOutputStream(filename));
			p.print(new String(cont));

			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(filename);

			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);

			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}

			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
			Cipher encoder = Cipher.getInstance("RSA");
			KeyPair kp = kg.generateKeyPair();

			Key pubKey = kp.getPublic();

			byte[] pub = pubKey.getEncoded();
			//				System.out.println("PUBLIC KEY" + pub);

			String pk = String.valueOf(pub);
			
			

			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
			
				if(block.equalsIgnoreCase("Block-1"))
			{
			
				 strQuery2 = "update cloudserver set ct1='"
						+ encryptedValue + "', mac1='" + h1 + "' where fname='" + file + "'  and ownername='"+owner+"' ";
			}
				if(block.equalsIgnoreCase("Block-2"))
			{
			
				 strQuery2 = "update cloudserver set ct2='"
						+ encryptedValue + "', mac2='" + h1 + "' where fname='" + file + "'  and ownername='"+owner+"' ";
			}
				if(block.equalsIgnoreCase("Block-3"))
			{
			
				 strQuery2 = "update cloudserver set ct3='"
						+ encryptedValue + "', mac3='" + h1 + "' where fname='" + file + "'  and ownername='"+owner+"' ";
			}
				if(block.equalsIgnoreCase("Block-4"))
			{
			
				 strQuery2 = "update cloudserver set ct4='"
						+ encryptedValue + "', mac4='" + h1 + "' where fname='" + file + "'  and ownername='"+owner+"' ";
			}
			
				connection.createStatement().executeUpdate(strQuery2);
				
			

			String type="External";
					String strQuery21 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+ aname+ "','"+ file+ "','"+ block+ "','"+ dt+ "','"+ type+ "')";
						connection.createStatement().executeUpdate(strQuery21);
%>
<p>
<h1 >Attacked Success Fully!!!<a href="Attack.jsp">Back</a></h1>
</p>
<br />

<%
}
catch(Exception e)
{
e.printStackTrace();

}
%>
            <p>&nbsp;</p>
          </div>
          <div class="clr"></div>
        </div>
        <p class="pages">&nbsp;</p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer">
    <div class="footer_resize"></div>
  </div>
</div>
<div align=center></div>
</body>
</html>
