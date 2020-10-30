using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for petshop_class
/// </summary>
public class petshop_class
{
    public SqlConnection con_pet = new SqlConnection();
    public SqlCommand cmd_pet;
    public SqlDataReader dr_pet;
    public SqlDataAdapter da_pet = new SqlDataAdapter();
    public string query;
    public DataTable dt_pet = new DataTable();
    public int sid;

    public void connet_petspot()
    {
        con_pet.ConnectionString = ConfigurationManager.ConnectionStrings["petcs"].ConnectionString;
        con_pet.Open();
    }
    public void selectpetspot(string query)
    {
        cmd_pet = new SqlCommand(query, con_pet);
        dr_pet = cmd_pet.ExecuteReader();

    }
    public void insertpetspot(string query)
    {
        cmd_pet = new SqlCommand(query, con_pet);
       cmd_pet.ExecuteNonQuery();

    }
    public void getpetspot(string query)
    {
         da_pet = new SqlDataAdapter(query, con_pet);
        da_pet.Fill(dt_pet);

    }

    public int getscalarid(string query)
    {
        cmd_pet = new SqlCommand(query, con_pet);
        sid = Convert.ToInt32(cmd_pet.ExecuteScalar());
        return sid;


    }
    public int orderid(string query)
    {
        int pid;
        cmd_pet = new SqlCommand(query, con_pet);
        if (cmd_pet.ExecuteScalar().ToString() != "")
            pid = Int32.Parse(cmd_pet.ExecuteScalar().ToString());
        else
            pid = 1000;
        return pid;
    }


    public int payid(string query)
    {
        int id;
        cmd_pet = new SqlCommand(query, con_pet);
        if (cmd_pet.ExecuteScalar().ToString() != "")
            id = Int32.Parse(cmd_pet.ExecuteScalar().ToString());
        else
            id = 20201000;
        return id;
    }

    public petshop_class()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}