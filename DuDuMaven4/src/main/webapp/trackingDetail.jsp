<%-- 
    Document   : trackingDetail
    Created on : 26-Oct-2023, 23:20:52
    Author     : Pham Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>DuDu- Do shop, Do Share</title>
        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link rel="stylesheet" href="css/trackingDetail.css"/>
    </head>
    <body>
      <div class="container-fluid my-5 d-sm-flex justify-content-center">
    <div class="card px-2">
        <div class="card-header bg-white">
          <div class="row justify-content-between">
            <div class="col">
                <p class="text-muted"> Order ID  <span class="font-weight-bold text-dark">${ol.order.orderID}</span></p> 
                <p class="text-muted"> Place On <span class="font-weight-bold text-dark">${ol.order.date}</span> </p>
                  <p class="text-muted"> Address <span class="font-weight-bold text-dark">${ol.order.address}</span> </p>
                 <p class="text-muted"> Phone <span class="font-weight-bold text-dark">${ol.order.user.phone}</span> </p>
                 <p class="text-muted"> Status <span class="font-weight-bold text-dark">${ol.status}</span> </p></div>
                <div class="flex-col my-auto">
                   
                </div>
          </div>
        </div>
        <div class="card-body">
            <div class="media flex-column flex-sm-row">
                <div class="media-body ">
                    <h5 class="bold">${ol.product.name}</h5>
                    <p class="text-muted"> Quantity: ${ol.quantity}</p>
                    <h4 class="mt-3 mb-4 bold">  <span class="small text-muted"> via ( ${ol.order.ship} ) </span></h4>
                    
                    <br/>
                    <a href="orderTracking?shopID=${ol.product.shop.shopID}"> <button type="button" class="btn  btn-outline-primary d-flex">Back to Order tracking</button>   </a>  
                </div><img class="align-self-center img-fluid" src="${ol.product.image}" width="180 " height="180">
                <div>
                    <h4>${ol.order.note}</h4>
                </div>
            </div>
        </div>
        <div class="row px-3">
            <div class="col">
                <ul id="progressbar" >
                   
                </ul>
            </div>
        </div>
<!--         <div class="card-footer  bg-white px-sm-3 pt-sm-4 px-0">
            <div class="row text-center  ">
                 
                <div class="col my-auto  border-line "><h5 >Confirm</h5></div>
                <div class="col  my-auto  border-line "><h5>Process</h5></div>
                <div class="col my-auto   border-line "><h5>Dispatch</h5></div>
                <div class="col my-auto   border-line "><h5>Delivery</h5></div>
                <div class="col  my-auto mx-0 px-0 "><img class="img-fluid cursor-pointer" src="https://img.icons8.com/ios/50/000000/menu-2.png" width="30" height="30"></div>
            </div>
        </div>-->
    </div>
</div>
    </body>
</html>
