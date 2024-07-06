<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="com.oreilly.servlet.*,java.lang.*,java.text.SimpleDateFormat,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.util.Random,java.io.PrintStream, java.io.FileOutputStream, java.io.FileInputStream, java.security.DigestInputStream, java.math.BigInteger, java.security.MessageDigest, java.io.BufferedInputStream" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View_Files_Details</title>
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
.style18 {color: #FFFF00; font-weight: bold; }
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
          <li class="active"><a href="DO_Main.jsp"><span>Home </span></a></li>
          <li><a href="DO_Login.jsp"><span>Logout</span></a></li>
          
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
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12="",s13="",s14="",s15="";
	int i=0,j=0,k=0;
int id = Integer.parseInt(request.getParameter("usid"));
try 
	{
      		String query="Select *from cloudserver where id='"+id+"'"; 
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(query);
			while ( rs.next() )
			{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(3);
					s4=rs.getString(4);
					s5=rs.getString(5);
					s6=rs.getString(6);
					s7=rs.getString(7);
					s8=rs.getString(8);
					s9=rs.getString(9);
					s10=rs.getString(10);
					s11=rs.getString(11);
					s12=rs.getString(12);
					s13=rs.getString(13);
					s14=rs.getString(14);
					s15=rs.getString(15);
						
					if(s6.equalsIgnoreCase("Shared"))
					{
						String keys = "ef50a0ef2c3e3a5f";
						byte[] keyValue1 = keys.getBytes();
						Key key1 = new SecretKeySpec(keyValue1,"AES");
						Cipher c1 = Cipher.getInstance("AES");
						c1.init(Cipher.DECRYPT_MODE, key1);
						String fn = new String(Base64.decode(s5.getBytes()));
								
							String quey1="select * from cloudserver  where fname='"+fn+"' "; 
							Statement st1=connection.createStatement();
							ResultSet rs1=st1.executeQuery(quey1);
							if ( rs1.next())
							{
								j=rs1.getInt(1);
								String fnn=rs1.getString(2);
								String own=rs1.getString(3);
								String b1=rs1.getString(5);
								String m1=rs1.getString(6);
								String b2=rs1.getString(7);
								String m2=rs1.getString(8);
								String b3=rs1.getString(9);
								String m3=rs1.getString(10);
								String b4=rs1.getString(11);
								String m4=rs1.getString(12);
								String sk=rs1.getString(13);
								String dt=rs1.getString(14);
								String fsiz=rs1.getString(15);
								%>
</p>
          
          <h4 class="style26" >File Shared From <%=own%> With File : &quot; <%=fnn%>&quot;</h4>
          <table width="560" border="0" align="center">
            <tr>
              <td width="143" height="35" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>File Name :- </strong></span></div></td>
              <td width="407"><div align="center"><span class="style25"><%= s2 %></span></div></td>
            </tr>
            <tr>
              <td height="133" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>Block-1 </strong></span></div></td>
              <td><div align="center"><span class="style23">
                  <textarea name="text1" cols="50" rows="8" readonly="readonly"><%= b1 %></textarea>
              </span> </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>MAC-1: </strong></span></div></td>
              <td><div align="center">
                  <input name="t1" type="text" id="t4"
								value="<%= m1 %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="133" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>Block-2 </strong></span></div></td>
              <td><div align="center"><span class="style23">
                  <textarea name="text2" cols="50" rows="8" readonly="readonly"><%= b2 %></textarea>
              </span> </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>MAC-2: </strong></span></div></td>
              <td><div align="center">
                  <input name="t2" type="text" id="t4"
								value="<%= m2 %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="133" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>Block-3 </strong></span></div></td>
              <td><div align="center"><span class="style23">
                  <textarea name="text3" cols="50" rows="8" readonly="readonly"><%= b3 %></textarea>
              </span> </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>MAC-3: </strong></span></div></td>
              <td><div align="center">
                  <input name="t3" type="text" id="t4"
								value="<%=m3%>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="133" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>Block-4 </strong></span></div></td>
              <td><div align="center"><span class="style23">
                  <textarea name="text4" cols="50" rows="8" readonly="readonly"><%= b4 %></textarea>
              </span> </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>MAC-4: </strong></span></div></td>
              <td><div align="center">
                  <input name="t4" type="text" id="t4"
								value="<%= m4 %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style17"><span class="style25">Secret Key : </span></div></td>
              <td><div align="center">
                  <input name="t42" type="text" id="t42"
								value="<%= sk %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>Date &amp; Time : </strong></span></div></td>
              <td><div align="center">
                  <input name="t43" type="text" id="t43"
								value="<%= s14 %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style17"><span class="style23 style22 style4"><strong>File Size : </strong></span></div></td>
              <td><div align="center">
                  <input name="t43" type="text" id="t43"
								value="<%= fsiz %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
          </table>
          <p>
            <%
							}
			  
				  }
				  else
				  {
				
			

						%>
          </p>
          <p class="infopost">&nbsp;</p>
          <table width="560" border="0" align="center">
            <tr>
              <td width="143" height="35" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">File Name :- </span></div></td>
              <td width="407"><div align="center"><span class="style25"><%= s2 %></span></div></td>
            </tr>
            <tr>
              <td height="133" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">Block-1 </span></div></td>
              <td><div align="center"><span class="style23">
                  <textarea name="text1" cols="50" rows="8" readonly="readonly"><%= s5 %></textarea>
              </span> </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">MAC-1: </span></div></td>
              <td><div align="center">
                  <input name="t1" type="text" id="t4"
			value="<%= s6 %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="133" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">Block-2 </span></div></td>
              <td><div align="center"><span class="style23">
                  <textarea name="text2" cols="50" rows="8" readonly="readonly"><%= s7 %></textarea>
              </span> </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">MAC-2: </span></div></td>
              <td><div align="center">
                  <input name="t2" type="text" id="t4"
			value="<%= s8 %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="133" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">Block-3 </span></div></td>
              <td><div align="center"><span class="style23">
                  <textarea name="text3" cols="50" rows="8" readonly="readonly"><%= s9 %></textarea>
              </span> </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">MAC-3: </span></div></td>
              <td><div align="center">
                  <input name="t3" type="text" id="t4"
			value="<%=s10%>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="133" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">Block-4 </span></div></td>
              <td><div align="center"><span class="style23">
                  <textarea name="text4" cols="50" rows="8" readonly="readonly"><%= s11 %></textarea>
              </span> </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">MAC-4: </span></div></td>
              <td><div align="center">
                  <input name="t4" type="text" id="t4"
			value="<%= s12 %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style18"><span class="style25">Secret Key : </span></div></td>
              <td><div align="center">
                  <input name="t42" type="text" id="t42"
			value="<%= s13 %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">Date &amp; Time : </span></div></td>
              <td><div align="center">
                  <input name="t43" type="text" id="t43"
			value="<%= s14 %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style18"><span class="style23 style22 style4">File Size : </span></div></td>
              <td><div align="center">
                  <input name="t43" type="text" id="t43"
								value="<%= s15 %>" size="50" readonly="readonly" />
              </div></td>
            </tr>
          </table>
          <p>
            <%
			  }
				
		}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
            <p align="justify">&nbsp;</p>
            <p align="right"><a href="DO_Main.jsp">Back</a></p>
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
                
                <li><a href="DO_Main.jsp">Home </a></li>
                <li><a href="DO_Login.jsp">Logout</a></li>
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
