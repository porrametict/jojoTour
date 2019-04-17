<%@ Page Language="C#" Title="FAMILY PRIVATE TOUR BY JOJOTOUR" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Home.aspx.cs" Inherits="Customer_PackageTour" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-center"><%: Title %></h1>

    <div>

        <%--- <div class="col-sm-20">


            <div class="col px-1 py-2 m-2"> ---%>

        <div class="bd-example" class="col px-1 py-2 m-0 col-sm-20">
            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="jojopics/01.jpg" alt="Please Waiting" class="w-100 img-fluid fit-cover fit-pos-top lazyloaded">


                        <div class="carousel-caption d-none d-md-block ">

                            <div class="page-splash__text">

                                <h1 class="text-center">เที่ยวทัวร์ไหนดี?</h1>
                                <h3 class="text-center">หาทัวร์ครบ จบที่นี่ครับ</h3>

                            </div>
                            <br />
                            <br />
                            <form class="page-splash__form mx-auto position-relative" action="/tours/search">
                                <div class="input-group mb-3">
                                    <input id="homeSearchQuery" type="text" class="form-control form-control-lg text-center" placeholder="ไปจังหวัดไหนดี ค้นหาเลย!" name="query" autocomplete="off">

                                    </input>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="fa fa-search"></i>
                                        </span>

                                    </div>
                                </div>
                            </form>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <h1>Phu Chi Fah</h1>
                            <p>Appreciate the highest peak and the most beautiful nature in Chiang Rai.</p>
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="jojopics/02.jpg" class="d-block w-100" alt="Please Waiting">
                        <div class="carousel-caption d-none d-md-block ">

                            <div class="page-splash__text">

                                <h1 class="text-center">เที่ยวทัวร์ไหนดี?</h1>
                                <h3 class="text-center">หาทัวร์ครบ จบที่นี่ครับ</h3>

                            </div>
                            <br />
                            <br />
                            <form class="page-splash__form mx-auto position-relative" action="/tours/search">
                                <div class="input-group mb-3">
                                    <input id="homeSearchQuery" type="text" class="form-control form-control-lg text-center" placeholder="ไปจังหวัดไหนดี ค้นหาเลย!" name="query" autocomplete="off">

                                    </input>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="fa fa-search"></i>
                                        </span>

                                    </div>
                                </div>
                            </form>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <h1>Phu Chi Fah</h1>
                            <p>Appreciate the highest peak and the most beautiful nature in Chiang Rai.</p>
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="jojopics/03.jpg" class="d-block w-100" alt="Please Waiting">
                        <div class="carousel-caption d-none d-md-block ">

                            <div class="page-splash__text">

                                <h1 class="text-center">เที่ยวทัวร์ไหนดี?</h1>
                                <h3 class="text-center">หาทัวร์ครบ จบที่นี่ครับ</h3>

                            </div>
                            <br />
                            <br />
                            <form class="page-splash__form mx-auto position-relative" action="/tours/search">
                                <div class="input-group mb-3">
                                    <input id="homeSearchQuery" type="text" class="form-control form-control-lg text-center" placeholder="ไปจังหวัดไหนดี ค้นหาเลย!" name="query" autocomplete="off">

                                    </input>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="fa fa-search"></i>
                                        </span>

                                    </div>
                                </div>
                            </form>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <h1>Phu Chi Fah</h1>
                            <p>Appreciate the highest peak and the most beautiful nature in Chiang Rai.</p>
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>



    </div>

</asp:Content>
