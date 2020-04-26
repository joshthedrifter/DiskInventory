/******************************* C# Flower Box ************************************/
/*  Date	   Name	    Description                                               */
/*  ----------------------------------------------------------------------------- */
/*                                                                                */
/*  4/26/2020  Josh   Initial implementation of borrower entry page               */
/**********************************************************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiskInv
{
    public partial class Borrowers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblMessage.Text = txtFirst.Text + " " + txtLast.Text + " added to the database.";
                txtFirst.Text = "";
                txtLast.Text = "";
                txtPhone.Text = "";
            }
        }
    }
}