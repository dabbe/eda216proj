<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Krusty Kookies AB</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/mycss.css" rel="stylesheet">
   </head>
   <body ng-app="krustyapp" ng-controller="krustycontroller">
      <div class="container">
      <div class="box">
         <div ng-include='"header.html"'></div>
         <div class="row">
            <div class="col-lg-4">
                <form ng-submit="palletnbr()">
                  <input type="text" id="nbr" class="form-control" placeholder="Search with pallet number..">
                </form>
            </div>
            <div class="col-lg-4">
                <form ng-submit="productname()">
                  <input type="text" class="form-control" placeholder="Search with product name..">
                </form>
            </div>        
         <div class="col-lg-4">
                <form ng-submit="productname()">
                  <input type="text" class="form-control" placeholder="Search with date interval..">
               </form>
            </div>      
             </div>
      </div>
      </div>

<div class="container">
<div class="box">
      <ul class="list-group">
         <li class="list-group-item" ng-repeat="pallet in pallets">
            <div class="col-md-10">
               <b>Cookie:</b> {{pallet.cookie}}<br>
               <b>Date produced:</b> {{pallet.date_produced}}<br>
               <span ng-show="{{pallet.date_delivered}}"><b>Date delivered:</b> {{pallet.date_delivered}}<br></span>
               <span ng-show="{{pallet.customer_name}}"><b>Customer name:</b> {{pallet.customer_name}}<br></span>
               <span ng-hide="{{pallet.date_delivered}}">The pallet has not been delivered!</span>
            </div>
            <div class="col-md-2">
               <button> Block</button>
            </div>
            <div class="clearfix"></div>
         </li>
         </p>  
      </ul>
      <div class="clearfix"></div>
      </div>
      </div>
      </div>
      </div>
     
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular.min.js"></script>
      <script>
         var app = angular.module('krustyapp', []);
          function krustycontroller($scope, $http){

            $scope.palletnbr = function(){
            var v = document.getElementById("nbr").value;

            $http.get('getPallets.php?nbr=' + v).then(function(res){
              $scope.pallets = res.data;
             });
           };

            $scope.productname = function(){
            $http.get('getPallets.php').then(function(res){
               $scope.pallets = res.data;
             });

           };
         };
      </script>
   </body>
</html>