<%@ Page Language="C#" Title="Add Location" AutoEventWireup="true" MasterPageFile="~/SiteAdmin.master" CodeFile="AddLocation.aspx.cs" Inherits="Customer_PackageTour" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
    <div class="row">
        <div class="col px-5 py-2 bg-light" >
            <div class="form-group ">
                <label >ชื่อสถานที่ภาษาไทย</label>
                <asp:TextBox ID="TextBoxTHname" CssClass="form-control " runat="server" ControlToValidate="TextBoxTHname"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTHName" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="TextBoxTHname" SetFocusOnError="True">กรุณากรอกช่องนี้</asp:RequiredFieldValidator>
            </div> 

            <div class="form-group ">
                <label >ชื่อสถานที่ภาษาอังกฤษ</label>
                <asp:TextBox ID="TextBoxENname" CssClass="form-control " runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorENName" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="TextBoxENname" SetFocusOnError="True">กรุณากรอกช่องนี้</asp:RequiredFieldValidator>

            </div>

            <div class="row">
                 <div class="form-group col">
                    <label >ประเภท</label>
                     <asp:DropDownList ID="DropDownListType" runat="server" CssClass="form-control " DataSourceID="SqlDataSourceLocationType" DataTextField="th_name" DataValueField="id"></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSourceLocationType" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT * FROM [type_location]"></asp:SqlDataSource>
                </div>
              
                 <div class="form-group col">
                    <label >จังหวัด</label>
                    <asp:DropDownList ID="DropDownListProvice" runat="server" CssClass="form-control " DataSourceID="SqlDataSourceProvice" DataTextField="th_name" DataValueField="id"></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSourceProvice" runat="server" ConnectionString="<%$ ConnectionStrings:jojoDBConnectionString %>" SelectCommand="SELECT * FROM [province]"></asp:SqlDataSource>
                </div>

            </div>

             <div class="form-group ">
                <label >รายละเอียดภาษาไทย</label>
                <asp:TextBox ID="TextBoxTHdetail" CssClass="form-control " runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
            </div> 

            <div class="form-group ">
                <label >รายละเอียดภาษาอังกฤษ</label>
                <asp:TextBox ID="TextBoxENdetail" CssClass="form-control " runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
            </div>

            <div>
                Upload Images
                <div id="showimage">
                </div>
                <br />
                <div class="input-file">
                     <label for="File1" class="input-label">Select files</label>
                    <input type="file" multiple="multiple" name="File1" id="File1" accept="image/*" class="form-control-file" />
                </div>
                <br />                   
                <hr />

            </div>

            <script>
                $(document).ready(function () {
                    $("#File1").change(function () {

                        var previewimages = $("#showimage");
                        previewimages.html("");
                        $($(this)[0].files).each(function () {
                            var file = $(this);
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                var img = $("<img />");
                                img.attr("style", "height:150px;width: auto ;margin:5px;");
                                img.attr("src", e.target.result);
                                previewimages.append(img);
                            }
                            reader.readAsDataURL(file[0]);
                        });

                    });
                });
            </script>

           <div class="row justify-content-end mr-1">
                <asp:Button ID="ButtonSave" runat="server" Text="บันทึก" CssClass="btn btn-success" OnClick="ButtonSave_Click"/>
           </div>
            

        </div>
        
    </div>
</asp:Content>
