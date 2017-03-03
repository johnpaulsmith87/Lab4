using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Schema;
using System.Xml;

public partial class Validator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (fupXMLDocument.HasFile && fupXMLSchema.HasFile)
        {
            int totalErrors = 0;

            XmlReader schemaReader = XmlReader.Create(fupXMLSchema.FileContent);
            XmlSchemaSet schemaSet = new XmlSchemaSet();
            schemaSet.Add("http://www.algonquincollege.com/onlineservice/reviews", schemaReader); //might have to adjust this!
            
            XmlReaderSettings readerSettings = new XmlReaderSettings();
            readerSettings.Schemas = schemaSet;
            readerSettings.ValidationType = ValidationType.Schema;
            readerSettings.ValidationEventHandler += (s, args) =>
            {
                // write the validation errors here
                string severity = args.Severity.ToString();
                string message = args.Message;
                int lineNumber = args.Exception.LineNumber;
                int column = args.Exception.LinePosition;
                totalErrors++;
                TableRow row = new TableRow();
                row.Cells.Add(new TableCell() { Text = string.Format("{0}", severity) });
                row.Cells.Add(new TableCell() { Text = string.Format("{0}", lineNumber) });
                row.Cells.Add(new TableCell() { Text = string.Format("{0}", column) });
                row.Cells.Add(new TableCell() { Text = message });
                tblErrors.Rows.Add(row);
            };
            XmlReader readerXml = XmlReader.Create(fupXMLDocument.FileContent, readerSettings);
            while (readerXml.Read())
            { }
            pnlUploadXml.Visible = false;
            if (totalErrors > 0)
            {
                tblErrors.Visible = true;
                lblResults.Text = "There were " + totalErrors + " total errors.";
            }
            else
                lblResults.Text = "Validation Successful!";
        }
    }



    protected void btnValidate_Click(object sender, EventArgs e)
    {
       

    }
}