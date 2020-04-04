using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    
    public partial class WebForm1 : System.Web.UI.Page
    {
        private string StringSqlConnection = "Data Source=ASUS-PC;Initial Catalog=dbtest;User ID=sa;Password=123456";
        ///private string StringRemoteConnection = "Data Source=bds289496282.my3w.com;Initial Catalog=bds289496282_db;User ID=bds289496282;Password=AsDf0724";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signin_Click(object sender, EventArgs e)
        {
            if (pwd.Text == "" || name.Text=="")
            {
                Label3.Text = "用户名或密码不能为空";
            }
            else
            {
                SqlConnection ClassSqlConnection = new SqlConnection(StringSqlConnection);
                try
                {
                    ClassSqlConnection.Open();
                    SqlCommand ClassSqlCommand = new SqlCommand();

                    ClassSqlCommand.CommandText = "SELECT * from userpwd where name = '" + name.Text.ToString() + "'";
                    ClassSqlCommand.Connection = ClassSqlConnection;
                    SqlDataReader ClassSqlReader = ClassSqlCommand.ExecuteReader();
                    if (ClassSqlReader.HasRows == false)
                    {
                        Label3.Text = "当前用户不存在";
                    }
                    else
                    {
                        ClassSqlReader.Read();
                        if (ClassSqlReader[2].ToString() == pwd.Text.ToString())
                        {
                            Label3.Text = "登陆成功，正在跳转";

                           /// Response.Redirect("MainPage.html", true);
                        }
                        else
                        {
                            Label3.Text = "密码错误";
                        }
                        ClassSqlReader.Close();
                    }
                }

                finally
                {
                    ClassSqlConnection.Close();
                }
            }
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            if (pwd.Text == "" || name.Text == "")
            {
                Label3.Text = "用户名或密码不能为空";
            }
            else
            {
                SqlConnection ClassSqlConnection = new SqlConnection(StringSqlConnection);
                try
                {
                    ClassSqlConnection.Open();
                    SqlCommand ClassSqlCommand = new SqlCommand();

                    ClassSqlCommand.CommandText = "SELECT * from userpwd where name = '" + name.Text.ToString()+"'";
                    ClassSqlCommand.Connection = ClassSqlConnection;
                    SqlDataReader ClassSqlReader = ClassSqlCommand.ExecuteReader();
                    if (ClassSqlReader.HasRows == true)
                    {
                        Label3.Text = "该用户名已被使用";
                        ClassSqlReader.Close();

                    }
                    else
                    {
                        ClassSqlReader.Close();
                        ClassSqlCommand.CommandText = "INSERT INTO userpwd (name,pwd ) VALUES ("+"'"+name.Text.ToString()+"','"+pwd.Text.ToString()+"'"+")";
                        ClassSqlCommand.Connection = ClassSqlConnection;
                        ClassSqlCommand.ExecuteNonQuery();
                        Label3.Text = "注册成功，请重新登录";
                        
                        Response.Redirect("login.aspx",true);
                    }
                }

                finally
                {
                    ClassSqlConnection.Close();
                }
            }
        }
    }
}