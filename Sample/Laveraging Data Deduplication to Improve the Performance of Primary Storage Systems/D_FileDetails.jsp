<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Deduplicator </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24}
.style2 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style3 {font-size: 36px; }
.style18 {
	font-size: 16px;
	font-style: italic;
	font-weight: bold;
}
.style19 {font-size: 18px; color: #353C3E;}
.style21 {font-size: 14px}
.style23 {color: #666666; font-weight: bold;}
.style26 {color: #353c3e}
.style25 {color: #353c3e; font-weight: bold; }
.style26 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="D_Main.jsp">DEDUPLICATOR</a></li>
          <li><a href="D_Login.jsp">LOGOUT</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3">Leveraging Data Deduplication to Improve the Performance of Primary Storage Systems in the Cloud</h1>
      </div>
      <div class="clr style1"></div>
      <div class="slider style1">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /> </a> </div>
        <div class="style2"></div>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="content style1">
    <div class="content_resize">
      <div class="mainbar">
        <div class="mainbar">
          <div class="article">
            <h2> View File Status </h2>
            <p class="infopost">
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
            <p class="infopost">&nbsp;</p>
            <h4 class="style26" >File Shared From <%=own%> With File : &quot; <%=fnn%>&quot;</h4>
            <table width="560" border="0" align="center">
              <tr>
                <td width="143" height="35"><div align="center"><span class="style23 style22 style4"><strong>File Name :- </strong></span></div></td>
                <td width="407"><div align="center"><span class="style25"><%= s2 %></span></div></td>
              </tr>
              <tr>
                <td height="133"><div align="center"><span class="style23 style22 style4"><strong>Block-1 </strong></span></div></td>
                <td><div align="center"><span class="style26">
                    <textarea name="text1" cols="50" rows="8" readonly="readonly"><%= b1 %></textarea>
                </span> </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>MAC-1: </strong></span></div></td>
                <td><div align="center">
                    <input name="t1" type="text" id="t4"
								value="<%= m1 %>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="133"><div align="center"><span class="style23 style22 style4"><strong>Block-2 </strong></span></div></td>
                <td><div align="center"><span class="style26">
                    <textarea name="text2" cols="50" rows="8" readonly="readonly"><%= b2 %></textarea>
                </span> </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>MAC-2: </strong></span></div></td>
                <td><div align="center">
                    <input name="t2" type="text" id="t4"
								value="<%= m2 %>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="133"><div align="center"><span class="style23 style22 style4"><strong>Block-3 </strong></span></div></td>
                <td><div align="center"><span class="style26">
                    <textarea name="text3" cols="50" rows="8" readonly="readonly"><%= b3 %></textarea>
                </span> </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>MAC-3: </strong></span></div></td>
                <td><div align="center">
                    <input name="t3" type="text" id="t4"
								value="<%=m3%>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="133"><div align="center"><span class="style23 style22 style4"><strong>Block-4 </strong></span></div></td>
                <td><div align="center"><span class="style26">
                    <textarea name="text4" cols="50" rows="8" readonly="readonly"><%= b4 %></textarea>
                </span> </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>MAC-4: </strong></span></div></td>
                <td><div align="center">
                    <input name="t4" type="text" id="t4"
								value="<%= m4 %>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style25">Secret Key : </span></div></td>
                <td><div align="center">
                    <input name="t42" type="text" id="t42"
								value="<%= sk %>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>Date &amp; Time : </strong></span></div></td>
                <td><div align="center">
                    <input name="t43" type="text" id="t43"
								value="<%= s14 %>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>File Size : </strong></span></div></td>
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
                <td width="143" height="35"><div align="center"><span class="style23 style22 style4"><strong>File Name :- </strong></span></div></td>
                <td width="407"><div align="center"><span class="style25"><%= s2 %></span></div></td>
              </tr>
              <tr>
                <td height="133"><div align="center"><span class="style23 style22 style4"><strong>Block-1 </strong></span></div></td>
                <td><div align="center"><span class="style26">
                    <textarea name="text1" cols="50" rows="8" readonly="readonly"><%= s5 %></textarea>
                </span> </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>MAC-1: </strong></span></div></td>
                <td><div align="center">
                    <input name="t1" type="text" id="t4"
			value="<%= s6 %>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="133"><div align="center"><span class="style23 style22 style4"><strong>Block-2 </strong></span></div></td>
                <td><div align="center"><span class="style26">
                    <textarea name="text2" cols="50" rows="8" readonly="readonly"><%= s7 %></textarea>
                </span> </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>MAC-2: </strong></span></div></td>
                <td><div align="center">
                    <input name="t2" type="text" id="t4"
			value="<%= s8 %>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="133"><div align="center"><span class="style23 style22 style4"><strong>Block-3 </strong></span></div></td>
                <td><div align="center"><span class="style26">
                    <textarea name="text3" cols="50" rows="8" readonly="readonly"><%= s9 %></textarea>
                </span> </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>MAC-3: </strong></span></div></td>
                <td><div align="center">
                    <input name="t3" type="text" id="t4"
			value="<%=s10%>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="133"><div align="center"><span class="style23 style22 style4"><strong>Block-4 </strong></span></div></td>
                <td><div align="center"><span class="style26">
                    <textarea name="text4" cols="50" rows="8" readonly="readonly"><%= s11 %></textarea>
                </span> </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>MAC-4: </strong></span></div></td>
                <td><div align="center">
                    <input name="t4" type="text" id="t4"
			value="<%= s12 %>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style25">Secret Key : </span></div></td>
                <td><div align="center">
                    <input name="t42" type="text" id="t42"
			value="<%= s13 %>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>Date &amp; Time : </strong></span></div></td>
                <td><div align="center">
                    <input name="t43" type="text" id="t43"
			value="<%= s14 %>" size="50" readonly="readonly" />
                </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="style23 style22 style4"><strong>File Size : </strong></span></div></td>
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
            </p>
            <p></p>
            <p class="infopost">&nbsp;</p>
            <div class="style2"></div>
            <div class="img">
              <div align="justify"></div>
            </div>
            <div class="post_content">
              <p align="right"><a href="D_Main.jsp">Back</a></p>
            </div>
            <div class="style2"></div>
          </div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="gadget">
          <h2 class="star"> Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><a href="D_Main.jsp">Home</a></li>
            <li><a href="D_Login.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="fbg style1">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>Storage Capacity</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2>Data Redundancy</h2>
        <p align="justify">Experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on disks due to relatively high temporal access locality associated with small I/O requests to redundant data. Moreover, directly applying data deduplication to primary storage systems in the Cloud will likely cause space contention in memory and data fragmentation<br />
        on disks.</p>
      </div>
      <div class="col c3">
        <h2>Primary Storage</h2>
        <p align="justify">Recent studies have shown that moderate to high data redundancy clearly exists in primary storage systems in the Cloud. Our experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on<br />
        disks due to relatively high temporal access locality associated with small I/O requests to redundant data.</p>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="footer style1">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style1"></div>
</body>
</html>
