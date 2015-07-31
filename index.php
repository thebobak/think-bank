<!doctype html>
<?php


  // Query the Database for all current records //

  $query = "SELECT * FROM Think order by ID limit 0,200"; 
  $result = $mysqli->query($query);
?>

<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Foundation</title>
    <link rel="stylesheet" href="stylesheets/app.css" />
    <script src="bower_components/modernizr/modernizr.js"></script>
  </head>
  <body>
    
       
 
      <div class="row">
        <div class="large-12 columns">
          <div class="panel">
            <h1>ThinkBank</h1>
          </div>
        </div>
      </div>
       
      <div class="row">
      
        <!-- Left Sidebar -->
        <div class="large-3 columns">
          <div class="panel">
              <div class="section-container vertical-nav" data-section data-options="deep_linking: false; one_up: true">
              <section class="section">
                <h5 class="title"><a href="#">Section 1</a></h5>
              </section>
              <section class="section">
                <h5 class="title"><a href="#">Section 2</a></h5>
              </section>
              <section class="section">
                <h5 class="title"><a href="#">Section 3</a></h5>
              </section>
              <section class="section">
                <h5 class="title"><a href="#">Section 4</a></h5>
              </section>
              <section class="section">
                <h5 class="title"><a href="#">Section 5</a></h5>
              </section>
              <section class="section">
                <h5 class="title"><a href="#">Section 6</a></h5>
              </section>
            </div>
     
          </div>
        </div>
        
         
        <!-- Main Feed -->
        <div class="large-6 columns">
     


        <?php
          if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
        ?>
              <!-- Feed Item -->
              <div class="row feed-item">
              <div class="large-2 columns small-3"><img src="http://placehold.it/80x80&text=[img]"/></div>
              <div class="large-10 columns">
              <a href="<?php echo $row["Hyperlink"] ?>"><h1><?php echo $row["Title"]?></h1></a>
              <h2><?php echo $row["Authors"]?></h2>
              <h3><?php echo $row["Organization"]?></h3>
              <p>[tag][tag][tag]</p>
              <h4><?php echo $row["Date"]?></h4>

              <ul class="inline-list">
                <li><a href="">Share</a></li>
              </ul>
            </div>
          </div>
          <hr/>
        <?php
            }
          }
          else {
            echo "Sorry, no records were found!";
          }
        ?>

        </div>
     
         
         
        <aside class="large-3 columns hide-for-small">
          <p><img src="http://placehold.it/300x440&text=[ad]"/></p>
        </aside>
     
      </div>
     
     
       
     
      <footer class="row">
        <div class="large-12 columns">
          <hr/>
          <div class="row">
            <div class="large-5 columns">
              <p>© ThinkBank</p>
            </div>
            <div class="large-7 columns">
              <ul class="inline-list right">
                <li><a href="#">Section 1</a></li>
                <li><a href="#">Section 2</a></li>
                <li><a href="#">Section 3</a></li>
                <li><a href="#">Section 4</a></li>
                <li><a href="#">Section 5</a></li>
                <li><a href="#">Section 6</a></li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
    <script src="bower_components/foundation/js/foundation.min.js"></script>
    <script src="js/app.js"></script>
  </body>
</html>