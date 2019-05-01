<%@ Page Language="C#" Title="FAMILY PRIVATE TOUR BY JOJOTOUR" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Home.aspx.cs" Inherits="Customer_PackageTour" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <hr />

    <main role="main">

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                <li data-target="#myCarousel" data-slide-to="3" class="active"></li>
            </ol>
            <div class="carousel-inner">

                <div class="carousel-item">
                    <%-- <img src="jojopics/01.jpg" alt="Please Waiting" class="w-100 img-fluid fit-cover fit-pos-top lazyloaded">  --%>
                    <img src="jojopics/002.jpg" width="100%" height="100%"  preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                        <rect fill="#777" width="100%" height="100%"></rect></svg>
                    <div class="container">
                        <div class="carousel-caption text-left">
                            <a href="#" class="text-reset">
                                <h1>White Temple</h1>
                            <h3>The most beautiful temple temple in Chiang Rai.</h3>
                            </a>
                            
                        </div>
                    </div>
                </div>

                <div class="carousel-item">
                    <img src="jojopics/001.jpg" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                        <rect fill="#777" width="100%" height="100%"></rect></svg>
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>Phu Chi Fah</h1>
                            <p>Appreciate the highest peak and the most beautiful nature in Chiang Rai.</p>
                        </div>
                    </div>
                </div>

                <div class="carousel-item active">
                    <img src="jojopics/003.jpg" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                        <rect fill="#777" width="100%" height="100%"></rect></img>
                    <div class="container">
                        <div class="carousel-caption text-right">
                            <h1>Phu Chi Fah</h1>
                            <p>Appreciate the highest peak and the most beautiful nature in Chiang Rai.</p>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


        <!-- Marketing messaging and featurettes
  ================================================== -->
        <!-- Wrap the rest of the page in another container to center all the content. -->

        <div class="container marketing">
            <h4 class="text-center"><%: Title %></h4>

            <!-- START THE FEATURETTES -->

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7">
                    <br />
                    <h2 class="featurette-heading">Chui Fong Tea Plantation.</h2><br />
                    <p class="lead">
                        Chui Fong Tea Plantation is the largest tea plantation in Thailand.
                        <br />
                        With an area of over 500 rai, planted in the hillside Which tourists can visit to take pictures 
                        and see the beauty of Choui Fong tea plantations in many points

                        <br /><br />In addition to seeing beautiful scenery Of Choui Fong Tea Plantation There is also another highlight that many people intend for this, that is the cafe of Choui Fong Tea Plantation.

                        <br /><br />Cafe of Chui Fong Tea Plantation There are many drinks and dessert menus made from green tea and local ingredients. But the most popular, who came to order that is Green tea drinks
                    </p>
                </div>
                <div class="col-md-5">
                    <img src="jojopics/99.jpg" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title>
                        <rect fill="#eee" width="100%" height="100%"></rect></svg>
                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7 order-md-2">
                   
                    <h2 class="featurette-heading">&nbsp; &nbsp; &nbsp; &nbsp;Phu Chi Fa Fog.</h2><br />
                    <p class="lead">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Phu Chi Fa Fog Is the highest peak in the Doi Pha Mon mountain<br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;range Adjacent to the Thai-Laos border, located in Thoeng <br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;district Chiang Rai province With the unique nature of the cliffs<br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;at the tip of the spire Is a long line pointing to the sky in Laos<br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Is the origin of the name called "Phu Chi Fa" For the height from<br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sea level, it is from 1,200-1,628 meters and the highest point is<br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;The viewpoint area.

                        <br /><br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;The most beautiful viewpoint Is the side that is adjacent to the Lao<br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;people There are steep cliffs here, which are a little far from<br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;the tent spot. Tourists who come often come to tent and walk up to <br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Phu Chi Fah to see the morning view. To watch the first sun of the day <br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Along with the mist sea
                    </p>
                </div>
                <div class="col-md-5 order-md-1">
                    <img src="jojopics/77.jpg" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title>
                        <rect fill="#eee" width="100%" height="100%"></rect></svg>
                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading">White Temple (Wat Rong Khun)</h2><br />
                    <p class="lead">White Temple Designed and built by Ajarn Chalermchai Kositpipat, 
                        a famous Thai artist, created with strong determination to create beautiful artistic works, 
                        harmonize Lanna culture with stucco motifs and large wall painters. 
                        The distinctive feature of the temple is the temple of the temple, 
                        which is also composed. The silver mirror pattern is shimmering to the floor. 
                        Ornamental gable With a serpent with a strange turkey The murals inside the 
                        temple are the paintings of the teachers themselves.
                        <br /><br />
                        "I hope to create a unique Buddhist art work. 
                        To appear as one of the greatest works of art in this world Declare the greatness 
                        of my nation to all mankind I therefore set my desire to give my life, use my best
                        time to create a Buddhist art work for the reign of King Rama IX, and to give life to death. 
                        "Temple is the words of Chalermchai Kositpipat Famous artist who designed and built the Rong 
                        Khun Temple The famous, Chalermchai district has 3 inspirations for building this temple: for the nation, 
                        religion and the king.
                    </p>
                </div>
                <div class="col-md-5">
                    <img src="jojopics/88.jpg" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title>
                        <rect fill="#eee" width="100%" height="100%"></rect></svg>
                </div>
            </div>

            <hr class="featurette-divider">

            <!-- /END THE FEATURETTES -->

        </div>
        <!-- /.container -->


        <!-- FOOTER -->
        <footer class="container">
            <p class="float-right"><a href="#">Back to top</a></p>
            <p>© 2020-2022 jojoTour, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
        </footer>
    </main>


</asp:Content>
