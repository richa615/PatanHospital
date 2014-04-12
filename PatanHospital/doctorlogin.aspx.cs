using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using AjaxControlToolkit;

namespace PatanHospital
{
    public partial class doctorlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

             /// <summary>
/// Summary description for CascadingDropdown
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService()]
public class CascadingDropdown : System.Web.Services.WebService
{
//Database connection string
private static string strconnection = ConfigurationManager.AppSettings["ConnectionString"].ToString();
//database connection
SqlConnection concountry = new SqlConnection(strconnection);
public CascadingDropdown () {

//Uncomment the following line if using designed components
//InitializeComponent();
}
/// <summary>
/// WebMethod to Populate COuntry Dropdown
/// </summary>
[WebMethod]
public CascadingDropDownNameValue[] BindCountryDetails(string knownCategoryValues,string category)
{
concountry.Open();
SqlCommand cmdcountry = new SqlCommand("select * from CountryTable", concountry);
cmdcountry.ExecuteNonQuery();
SqlDataAdapter dacountry = new SqlDataAdapter(cmdcountry);
DataSet dscountry = new DataSet();
dacountry.Fill(dscountry);
concountry.Close();
//create list and add items in it by looping through dataset table
List<CascadingDropDownNameValue> countrydetails = new List<CascadingDropDownNameValue>();
foreach(DataRow dtrow in dscountry.Tables[0].Rows)
{
string CountryID = dtrow["CountryID"].ToString();
string CountryName = dtrow["CountryName"].ToString();
countrydetails.Add(new CascadingDropDownNameValue(CountryName, CountryID));
}
return countrydetails.ToArray();
}
/// <summary>
/// WebMethod to Populate State Dropdown
/// </summary>
[WebMethod]
public CascadingDropDownNameValue[] BindStateDetails(string knownCategoryValues,string category)
{
int countryID;
//This method will return a StringDictionary containing the name/value pairs of the currently selected values
StringDictionary countrydetails =AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
countryID = Convert.ToInt32(countrydetails["Country"]);
concountry.Open();
SqlCommand cmdstate = new SqlCommand("select * from StateTable where CountryID=@CountryID", concountry);
cmdstate.Parameters.AddWithValue("@CountryID", countryID);
cmdstate.ExecuteNonQuery();
SqlDataAdapter dastate = new SqlDataAdapter(cmdstate);
DataSet dsstate = new DataSet();
dastate.Fill(dsstate);
concountry.Close();
//create list and add items in it by looping through dataset table
List<CascadingDropDownNameValue> statedetails = new List<CascadingDropDownNameValue>();
foreach (DataRow dtrow in dsstate.Tables[0].Rows)
{
string StateID = dtrow["StateID"].ToString();
string StateName = dtrow["StateName"].ToString();
statedetails.Add(new CascadingDropDownNameValue(StateName, StateID));
}
return statedetails.ToArray();
}
/// <summary>
/// WebMethod to Populate Region Dropdown
/// </summary>
[WebMethod]
public CascadingDropDownNameValue[] BindRegionDetails(string knownCategoryValues, string category)
{
int stateID;
//This method will return a StringDictionary containing the name/value pairs of the currently selected values
StringDictionary statedetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
stateID = Convert.ToInt32(statedetails["State"]);
concountry.Open();
SqlCommand cmdregion = new SqlCommand("select * from RegionTable where StateID=@StateID", concountry);
cmdregion.Parameters.AddWithValue("@StateID", stateID);
cmdregion.ExecuteNonQuery();
SqlDataAdapter daregion = new SqlDataAdapter(cmdregion);
DataSet dsregion = new DataSet();
daregion.Fill(dsregion);
concountry.Close();
//create list and add items in it by looping through dataset table
List<CascadingDropDownNameValue> regiondetails = new List<CascadingDropDownNameValue>();
foreach (DataRow dtrow in dsregion.Tables[0].Rows)
{
string RegionID = dtrow["RegionID"].ToString();
string RegionName = dtrow["RegionName"].ToString();
regiondetails.Add(new CascadingDropDownNameValue(RegionName, RegionID));
}
return regiondetails.ToArray();
}
}

        }
    }
}