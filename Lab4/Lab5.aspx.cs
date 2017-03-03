using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Xsl;

public partial class Lab5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            //put code here!
            int rating;
            if (int.TryParse(txtSearchRestaurant.Text, out rating))
            {
                XslCompiledTransform transform = null;
                if (Application["xslt"] == null)
                {
                    transform = new XslCompiledTransform();
                    string xsltPath = WebConfigurationManager.AppSettings["xslt"];
                    xsltPath = Server.MapPath(xsltPath);
                    transform.Load(xsltPath);
                    Application["xslt"] = transform;
                }
                else
                {
                    transform = Application["xslt"] as XslCompiledTransform;
                }


                XsltArgumentList xslArguments = new XsltArgumentList();
                xslArguments.AddParam("ratingInput", "", rating.ToString());

                StringBuilder sb = new StringBuilder();
                XmlWriter xmlWriter = XmlWriter.Create(sb);

                string xmlPath = WebConfigurationManager.AppSettings["xmlPath"];
                xmlPath = Server.MapPath(xmlPath);
                transform.Transform(xmlPath, xslArguments, xmlWriter);

                string htmlString = sb.ToString();
                reviews.InnerHtml = htmlString;
            }
            //reviews.InnerHtml = ...;
        }
    }
}