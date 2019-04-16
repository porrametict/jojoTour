<%@ Page Title="OrderPackageTour" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="OrderPackageTour.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <hr />
    <div>

        


            <div class="row overview-container">

                <div class="col-7 px-5 py-0 overview-left">
                    <br />
                    <br />
                    <div class="card w-100 px-3 py-3 text-center booking-channels booking-channels--large-device">



                        <div class="col-sm-5">
                            <div class="font-weight-bold">รายละเอียดทัวร์</div>
                        </div>
                        <hr />

                               <br />
                    <br />   <br />
                    <br />
                               <br />
                    <br />   <br />
                    <br />   <br />
                    <br /><br />
                    <br />   

                    </div>


                </div>

                <div class="col-4 overview-right">
                    <br />
                    <br />

                    <div class="card w-100 px-3 py-3 text-center booking-channels booking-channels--large-device">

                        <div class="col-sm-13">
                            <div class="font-weight-bold">รายละเอียดผู้จอง</div>
                            <hr />


                               <br />
                    <br />   <br />
                    <br />
                               <br />
                    <br />   <br />
                    <br />   <br />
                    <br />



                            <asp:LinkButton runat="server"
                                ID="ViewButton"
                                Text="จองทริปเลย"
                                CssClass="btn btn-danger btn-lg btn-block"
                                CommandName="order_btn"
                                CommandArgument='<%# Eval("id") %>' EnableTheming="True" />
                         

                            <%--- <button type="button" class="btn btn-outline-primary btn-lg btn-block">
                                <div class="font-weight-bold">
                                    <img src="icon/phone.png" height="35" width="35" />
                                    &nbsp; &nbsp; &nbsp; &nbsp;
                                            083-XXX-XXXX
                                </div>
                            </button>

                            <button type="button" class="btn btn-outline-success btn-lg btn-block">
                                <div class="font-weight-bold">
                                    <img src="icon/line.png" height="35" width="35" />
                                    &nbsp; &nbsp; &nbsp;
                                            Line:@JOJOTour
                                </div>
                            </button> ---%>
                        </div>

                    </div>
                </div>


            </div>
        
        <br /><br />





    </div>

</asp:Content>
