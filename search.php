<?php
require("includes/header.php");
require "conf/config.php";
?>
<?php
if ($_SERVER['REQUEST_METHOD'] == "POST") {

    if (empty($_POST['country_id']) or empty($_POST['price'])) {
        echo "<script>alert('some inputs are empty');</script>";
    } else {

        $country_id = $_POST['country_id'];
        $price = $_POST['price'];


        $searchs = $conn->query("SELECT * FROM cities WHERE country_id = $country_id 
        AND price < $price");
        $searchs->execute();

        $allSearchs = $searchs->fetchAll(PDO::FETCH_OBJ);
    }
} else {
    header("location: index.php");
}
?>

<div class="page-heading">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h4>Search Results</h4>
                <h2>Amazing Prices &amp; More</h2>
            </div>
        </div>
    </div>
</div>


<div class="amazing-deals">
    <div class="container">
        <div class="row">
            <?php foreach ($allSearchs as $search) : ?>
                <div class="col-lg-6 col-sm-6">
                    <div class="item">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="image">
                                    <img src="<?php echo CITIESIMAGES ;?>/<?php echo $search->image; ?>" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                                <div class="content">
                                    <span class="info">*Limited Offer Today</span>
                                    <h4><?php echo $search->name; ?></h4>
                                    <div class="row">
                                        <div class="col-6">
                                            <i class="fa fa-clock"></i>
                                            <span class="list"><?php echo $search->trip_days; ?> days</span>
                                        </div>
                                        <div class="col-6">
                                            <i class="fa fa-map"></i>
                                            <span class="list">Daily Places</span>
                                        </div>
                                    </div>
                                    <p>Limited Price: $<?php echo $search->price; ?> per person</p>
                                    <?php if (isset($_SESSION['username'])) : ?>
                                        <div class="main-button">
                                            <a href="reservation.php?id=<?php echo $search->id; ?>">Make a Reservation</a>
                                        </div>
                                    <?php else : ?>
                                        <p>Login to make reservation</p>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>
<?php require("includes/footer.php") ?>