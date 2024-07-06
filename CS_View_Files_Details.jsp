<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="com.oreilly.servlet.*,java.lang.*,java.text.SimpleDateFormat,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.util.Random,java.io.PrintStream, java.io.FileOutputStream, java.io.FileInputStream, java.security.DigestInputStream, java.math.BigInteger, java.security.MessageDigest, java.io.BufferedInputStream" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>CS_View_Files_Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-250.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style17 {color: #FFFF00}
.style18 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html"><span>Identity-Based Privacy Preserving Remote Data<br />
Integrity Checking With a Designated Verifier
</span></a><a href="index.html"><span></span></a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="CS_Main.jsp"><span>Home </span></a></li>
          <li><a href="CS_Login.jsp"><span>Logout</span></a></li>
          <li><a href="GM_Login.jsp"></a></li>
          <li><a href="TA_Login.jsp"></a></li>
          <li><a href="CS_Login.jsp"></a></li>
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
          <h2><span>View Files Details</span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="article">
             <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13,s14;
	int i=0,j=0,k=0;
try 
	{		
		
			
								
							String quey1="select * from cloudserver" ; 
							Statement st1=connection.createStatement();
							ResultSet rs1=st1.executeQuery(quey1);
							while( rs1.next())
							{
								j=rs1.getInt(1);
								s8=rs1.getString(2);
								s14=rs1.getString(3);
								s9=rs1.getString(6);
								s10=rs1.getString(8);
								s11=rs1.getString(10);
								s12=rs1.getString(12);
								s13=rs1.getString(14);
							
							%>
          <table width="586" border="1" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
            <tr bgcolor="#FF0000">
              <th width="137" height="30" scope="row"><span class="style23 style17">Id : </span></th>
			  <td bgcolor="#FFFFFF"><div align="center" class="style18 style23"><strong><%=j%></strong></div></td>
            </tr>
            <tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style17">File Name : </span></th>
              <td bgcolor="#FFFFFF"><div align="center" class="style18 style23"><strong><%=s8%></strong></div></td>
            </tr>
			<tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style17">Owner Name : </span></th>
              <td bgcolor="#FFFFFF"><div align="center" class="style18 style23"><strong><%=s14%></strong></div></td>
            </tr>
            <tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style17">Block1(Digital Sign): </span></th>
              <td bgcolor="#FFFFFF"><div align="center" class="style18 style23"><strong><%=s9%></strong></div></td>
            </tr>
            <tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style17">Block2(Digital Sign): </span></th>
              <td bgcolor="#FFFFFF"><div align="center" class="style18 style23"><strong><%=s10%></strong></div></td>
            </tr>
            <tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style17">Block3(Digital Sign): </span></th>
              <td bgcolor="#FFFFFF"><div align="center" class="style18 style23"><strong><%=s11%></strong></div></td>
            </tr>
            <tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style17">Block4(Digital Sign): </span></th>
              <td bgcolor="#FFFFFF"><div align="center" class="style18 style23"><strong><%=s12%></strong></div></td>
            </tr>
            <tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style17">Date &amp; Time : </span></th>
              <td bgcolor="#FFFFFF"><div align="center" class="style18 style23"><strong><%=s13%></strong></div></td>
            </tr>
            <tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style17">Detailed View : </span></th>
              <td><div align="center" class="style23"><a href="CS_View_Files_Details_More.jsp?usid=<%=j%>">
                <input name="Input" type="button" value="View" />
              </a></div></td>
            </tr>
          </table>
          <p>
            <%
							
							}
						
          
			  
				
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
            <p align="justify">&nbsp;</p>
            <p align="right"><a href="CS_Main.jsp">Back</a></p>
          </div>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search :" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="g1">
          <div class="g2">
            <div class="gadget">
              <h2 class="star">Menu</h2>
              <div class="clr"></div>
              <ul class="sb_menu">
                
                <li><a href="CS_Main.jsp">Home </a></li>
                <li><a href="CS_Login.jsp">Logout</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
